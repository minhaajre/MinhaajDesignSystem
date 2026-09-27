"""Jev content-origin gate for MinhaajDesignSystem builds (semantic half).

VERIFY.md splits the content-origin gate into an exact half (banned
CCIAF strings via grep) and a judgment half (verbatim headings, no
synthetic groupings, no eyebrow reuse). This module automates both:

- Deterministic (exact, outranks Jev): the VERIFY.md banned-string
  patterns over the rendered page. Any hit refuses.
- Jev (advisory): Nouls on whether every visible string traces to the
  source payload, whether grouping labels are source-justified, and
  whether any CCIAF sentence survived by paraphrase (the case regexes
  miss). Weak results route the page to human review; the visual gate
  stays human — Jev cannot see.

Live checks need TYPESAFE_API_KEY; combine logic tests offline in
tools/test_jev_origin.py.
"""

from __future__ import annotations

import os
import re
import sys
from pathlib import Path

from typesafe_sdk import Noul, TypeSafeClient

# Mirrors the VERIFY.md content-origin grep contract.
BANNED_PATTERNS = [
    r"analytical layers",
    r"calibrated decision logic",
    r"single recommendation when traditions disagree",
    r"Conflict Resolution Codex",
    r"Risk Awareness",
    r"Cross-Civilization Intelligence",
    r"BaZi Four Pillars",
    r"Five traditions",
    r"Hellenistic and Persian Tradition",
    r"Vedic Tradition",
    r"Islamic Tradition",
]
BANNED_RES = [re.compile(p, re.IGNORECASE) for p in BANNED_PATTERNS]

QUESTIONS = {
    "fully_sourced": Noul(
        instructions=(
            "Is every visible string on this page traceable to the "
            "source payload (verbatim or minimal Sentence-case "
            "normalization)? Boilerplate nav/footer chrome is exempt; "
            "all headings, paragraphs, and list items count."
        ),
    ),
    "grouping_justified": Noul(
        instructions=(
            "Are the page's grouping labels (layers, tiers, numbered "
            "groups) justified by actual counts in the source, rather "
            "than synthesized structure the source does not contain?"
        ),
    ),
    "leakage_free": Noul(
        instructions=(
            "Is the page free of CCIAF-origin sentences, headings, and "
            "labels, including paraphrased ones that keep the meaning "
            "while changing the words?"
        ),
    ),
}

REVIEW_NOUL = 0.5
MAX_CHARS = 6000


def visible_text(html: str) -> str:
    text = re.sub(r"(?is)<(script|style)[^>]*>.*?</\1>", " ", html or "")
    text = re.sub(r"(?s)<[^>]+>", " ", text)
    return re.sub(r"\s+", " ", text).strip()


def headings(html: str) -> list[str]:
    return [re.sub(r"\s+", " ", h).strip()
            for h in re.findall(r"(?is)<h[12][^>]*>(.*?)</h[12]>", html or "")]


def deterministic_leaks(page_html: str) -> list[str]:
    """Exact banned-string scan (the VERIFY.md grep half)."""
    return [f"banned string: {rx.pattern}"
            for rx in BANNED_RES
            if rx.search(page_html or "")]


def combine_origin(det_flags: list[str], jev: dict | None) -> dict:
    """Pure combine. Banned strings refuse; weak Jev reviews; without
    answers the page is ungraded."""
    if det_flags:
        return {"verdict": "refuse",
                "reasons": [f"deterministic: {f}" for f in det_flags]}
    if jev is None:
        return {"verdict": "ungraded", "reasons": []}
    flags = [qid for qid in ("fully_sourced", "grouping_justified",
                             "leakage_free")
             if jev.get(qid, 0.0) < REVIEW_NOUL]
    if flags:
        return {"verdict": "review",
                "reasons": [f"jev: {q}={jev[q]:.2f}" for q in flags]}
    return {"verdict": "accept", "reasons": []}


def check_origin(source_text: str, page_html: str,
                 model: str | None = None) -> dict:
    """Live origin check. Raises RuntimeError without TYPESAFE_API_KEY."""
    api_key = os.environ.get("TYPESAFE_API_KEY")
    if not api_key:
        raise RuntimeError("Set TYPESAFE_API_KEY to call TypeSafe.")
    det = deterministic_leaks(page_html)
    if det:
        return combine_origin(det, None) | {"page_headings": headings(page_html)}
    with TypeSafeClient() as client:
        kwargs = {"model": model} if model else {}
        response = client.system_one(
            state={"source": source_text[:MAX_CHARS],
                   "page_visible": visible_text(page_html)[:MAX_CHARS],
                   "page_headings": headings(page_html)[:40]},
            questions=QUESTIONS, **kwargs)
    answers = response.answers
    result = combine_origin([], {qid: answers[qid].noul for qid in QUESTIONS})
    result["page_headings"] = headings(page_html)
    return result


def main() -> None:
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", help="source payload text file")
    parser.add_argument("page", help="rendered page HTML file")
    parser.add_argument("--model", default=None)
    args = parser.parse_args()
    source = Path(args.source).read_text(encoding="utf-8")
    page = Path(args.page).read_text(encoding="utf-8")
    try:
        result = check_origin(source, page, model=args.model)
    except RuntimeError as exc:
        sys.exit(f"SKIP live call ({exc}); run test_jev_origin.py offline.")
    print(f"{result['verdict']} {result['reasons']}")


if __name__ == "__main__":
    main()

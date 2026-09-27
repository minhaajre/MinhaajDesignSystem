"""Offline tests for tools/jev_origin.py (no API calls)."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from jev_origin import (combine_origin, deterministic_leaks, headings,
                        visible_text)


class DeterministicTest(unittest.TestCase):
    def test_banned_string_refuses(self):
        page = "<h2>Five traditions compared</h2><p>text</p>"
        flags = deterministic_leaks(page)
        self.assertTrue(any("Five traditions" in f for f in flags))

    def test_clean_page_passes(self):
        page = "<h2>Featured talks</h2><p>A speaker series.</p>"
        self.assertEqual(deterministic_leaks(page), [])

    def test_case_insensitive(self):
        self.assertTrue(deterministic_leaks("<p>RISK AWARENESS panel</p>"))


class ExtractTest(unittest.TestCase):
    def test_visible_text_strips_tags(self):
        html = "<h1>Hi</h1><script>evil()</script><p>Body text</p>"
        text = visible_text(html)
        self.assertIn("Body text", text)
        self.assertNotIn("evil", text)

    def test_headings_h1_h2_only(self):
        html = "<h1>T</h1><h2>S</h2><h3>Detail</h3>"
        self.assertEqual(headings(html), ["T", "S"])


class CombineTest(unittest.TestCase):
    def test_refuse_outranks(self):
        result = combine_origin(["banned string: x"],
                                {"fully_sourced": 0.9,
                                 "grouping_justified": 0.9,
                                 "leakage_free": 0.9})
        self.assertEqual(result["verdict"], "refuse")

    def test_ungraded_without_jev(self):
        self.assertEqual(combine_origin([], None)["verdict"], "ungraded")

    def test_weak_noul_reviews(self):
        jev = {"fully_sourced": 0.9, "grouping_justified": 0.3,
               "leakage_free": 0.9}
        result = combine_origin([], jev)
        self.assertEqual(result["verdict"], "review")
        self.assertTrue(any("grouping_justified" in r
                            for r in result["reasons"]))

    def test_clean_accepts(self):
        jev = {"fully_sourced": 0.9, "grouping_justified": 0.8,
               "leakage_free": 0.85}
        self.assertEqual(combine_origin([], jev)["verdict"], "accept")


if __name__ == "__main__":
    unittest.main()

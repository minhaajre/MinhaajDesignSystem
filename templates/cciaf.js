(function(){
  // ── THEME
  const html = document.documentElement;
  const tog  = document.getElementById('tog');
  const saved = localStorage.getItem('cciaf-theme') || 'light';
  html.setAttribute('data-theme', saved);
  tog.setAttribute('aria-checked', saved === 'dark');

  tog.addEventListener('click', () => {
    const next = html.getAttribute('data-theme') === 'light' ? 'dark' : 'light';
    html.setAttribute('data-theme', next);
    tog.setAttribute('aria-checked', next === 'dark');
    localStorage.setItem('cciaf-theme', next);
  });

  // ── HAMBURGER
  const hbg  = document.getElementById('hbg');
  const mob  = document.getElementById('mobMenu');
  function cm(){ mob.classList.remove('open'); }
  window.cm = cm;
  hbg.addEventListener('click', e => {
    e.stopPropagation();
    mob.classList.toggle('open');
  });
  document.addEventListener('click', e => {
    if (!mob.contains(e.target) && e.target !== hbg) cm();
  });

  // ── SCROLL TOP
  const st = document.getElementById('st');
  window.addEventListener('scroll', () => {
    st.classList.toggle('on', window.scrollY > 500);
  }, { passive: true });
  st.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));

  // ── SCROLL DOTS
  const secs  = ['hero','gap','framework','trad','engage','about','references','contact'];
  const dots  = document.querySelectorAll('.sn-d');

  dots.forEach(d => {
    d.addEventListener('click', () => {
      document.getElementById(d.dataset.t)?.scrollIntoView({ behavior:'smooth' });
    });
    d.addEventListener('keydown', e => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        document.getElementById(d.dataset.t)?.scrollIntoView({ behavior:'smooth' });
      }
    });
  });

  function updateDots(){
    const mid = window.innerHeight * .38;
    let cur = secs[0];
    secs.forEach(id => {
      const el = document.getElementById(id);
      if (el && el.getBoundingClientRect().top <= mid) cur = id;
    });
    dots.forEach(d => d.classList.toggle('on', d.dataset.t === cur));
  }
  window.addEventListener('scroll', updateDots, { passive:true });
  updateDots();

  // ── REVEAL
  const revs = document.querySelectorAll('.r');
  const obs  = new IntersectionObserver(entries => {
    entries.forEach((e, i) => {
      if (e.isIntersecting){
        setTimeout(() => e.target.classList.add('on'), i * 55);
        obs.unobserve(e.target);
      }
    });
  }, { threshold: .06, rootMargin: '0px 0px -30px 0px' });
  revs.forEach(el => obs.observe(el));

  // ── CONTACT FORM
  const ctForm    = document.getElementById('ct-form');
  const ctWrap    = document.getElementById('ct-form-wrap');
  const ctSuccess = document.getElementById('ct-success');

  if (ctForm) {
    const CT_FIELDS = [
      ['ct-name',    'ct-err-name',    v => v.trim().length > 0],
      ['ct-email',   'ct-err-email',   v => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v.trim())],
      ['ct-message', 'ct-err-message', v => v.trim().length > 0],
    ];

    function ctValidate() {
      let first = null, ok = true;
      CT_FIELDS.forEach(([fid, eid, check]) => {
        const f = document.getElementById(fid);
        const valid = check(f.value);
        f.style.borderColor = valid ? '' : '#B84040';
        document.getElementById(eid).classList.toggle('show', !valid);
        if (!valid) { ok = false; if (!first) first = f; }
      });
      if (first) { first.scrollIntoView({ behavior:'smooth', block:'center' }); first.focus(); }
      return ok;
    }

    CT_FIELDS.forEach(([fid, eid]) => {
      document.getElementById(fid).addEventListener('input', () => {
        document.getElementById(fid).style.borderColor = '';
        document.getElementById(eid).classList.remove('show');
      });
    });

    ctForm.addEventListener('submit', async function(e){
      e.preventDefault();
      if (!ctValidate()) return;
      const btn = ctForm.querySelector('.cf-btn');
      btn.disabled = true;
      btn.textContent = 'Sending…';
      try {
        const res  = await fetch('https://api.web3forms.com/submit', {
          method:  'POST',
          headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
          body: JSON.stringify({
            access_key: 'c5813381-0b5c-433e-b59b-537a4c16af09',
            subject:    'CCIAF Website Enquiry — ' + document.getElementById('ct-name').value.trim(),
            from_name:  'CCIAF Website',
            name:       document.getElementById('ct-name').value.trim(),
            email:      document.getElementById('ct-email').value.trim(),
            message:    document.getElementById('ct-message').value.trim()
          })
        });
        const data = await res.json();
        if (data.success) {
          ctWrap.style.display    = 'none';
          ctSuccess.style.display = 'block';
          ctSuccess.scrollIntoView({ behavior: 'smooth', block: 'center' });
        } else {
          btn.disabled = false; btn.textContent = 'Send enquiry';
          alert('Could not send. Write directly to contact@psyda.org.');
        }
      } catch {
        btn.disabled = false; btn.textContent = 'Send enquiry';
        alert('Network error. Write directly to contact@psyda.org.');
      }
    });
  }
})();

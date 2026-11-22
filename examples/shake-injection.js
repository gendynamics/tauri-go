(function() {
  if (window.__TAURI_GO_INJECTED__) return;
  window.__TAURI_GO_INJECTED__ = true;

  let lastShake = 0;
  const THRESHOLD = 15;
  const COOLDOWN = 1500;

  window.addEventListener("devicemotion", (e) => {
    const acc = e.accelerationIncludingGravity;
    if (!acc) return;
    const mag = Math.sqrt(acc.x*acc.x + acc.y*acc.y + acc.z*acc.z);
    const now = Date.now();
    if (mag > THRESHOLD && now - lastShake > COOLDOWN) {
      lastShake = now;
      window.location.href = "tauri://localhost/shell.html";
    }
  }, true);

  let taps = 0;
  document.addEventListener("touchstart", (e) => {
    if (e.touches[0].clientX > window.innerWidth - 60 && e.touches[0].clientY < 60) {
      taps++;
      if (taps >= 3) {
        taps = 0;
        window.location.href = "tauri://localhost/shell.html";
      }
      setTimeout(() => taps = 0, 800);
    }
  });
})();

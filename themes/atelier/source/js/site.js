const header = document.querySelector(".site-header");
const toggle = document.querySelector(".menu-toggle");
const revealNodes = document.querySelectorAll(".reveal");

if (toggle && header) {
  toggle.addEventListener("click", () => {
    const nextState = !header.classList.contains("is-open");
    header.classList.toggle("is-open", nextState);
    toggle.setAttribute("aria-expanded", String(nextState));
  });
}

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("is-visible");
      }
    });
  },
  { threshold: 0.15 }
);

revealNodes.forEach((node) => observer.observe(node));

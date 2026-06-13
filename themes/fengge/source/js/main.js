/**
 * Fengge Theme - Minimal JavaScript
 */
(function () {
  'use strict';

  // Mobile navigation toggle
  var toggle = document.querySelector('.nav-toggle');
  var navLinks = document.querySelector('.nav-links');

  if (toggle && navLinks) {
    toggle.addEventListener('click', function () {
      var expanded = toggle.getAttribute('aria-expanded') === 'true';
      toggle.setAttribute('aria-expanded', !expanded);
      navLinks.classList.toggle('open');
    });
  }

  // Scroll reveal animation
  var revealElements = document.querySelectorAll('.post-item, .archive-item, .post-content h2, .post-content h3');

  if ('IntersectionObserver' in window && revealElements.length > 0) {
    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('revealed');
          observer.unobserve(entry.target);
        }
      });
    }, {
      threshold: 0.1,
      rootMargin: '0px 0px -50px 0px'
    });

    revealElements.forEach(function (el) {
      el.classList.add('reveal');
      observer.observe(el);
    });
  }
})();

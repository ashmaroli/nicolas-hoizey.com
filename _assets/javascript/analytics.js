// Hacked isogram with http://isogrammer.com/
(function(n, h, o, i, z, e, y) {
  n["GoogleAnalyticsObject"] = z;
  (n[z] =
    n[z] ||
    function() {
      (n[z].q = n[z].q || []).push(arguments);
    }),
    (n[z].l = 1 * new Date());
  (e = h.createElement(o)), (y = h.getElementsByTagName(o)[0]);
  e.async = 1;
  e.src = i;
  y.parentNode.insertBefore(e, y);
})(window, document, "script", "//www.google-analytics.com/analytics.js", "ga");

ga("create", "UA-1655999-10", "auto");

if (viewport_width > 0) {
  ga("set", {
    dimension1: screen_density,
    dimension2: viewport_width,
    dimension3: root_font_size
  });
} else {
  ga("set", {
    dimension1: screen_density,
    dimension2: 0,
    dimension3: root_font_size
  });
}

ga("send", "pageview");

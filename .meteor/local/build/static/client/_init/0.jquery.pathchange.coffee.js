/*
  Plugin that provides a "pathchange" event on the window object, notifying an application when the URL changes
  This is accomplished by watching the hash, using the hashchange event from HTML5 or a polling interval in older browsers.
  In addition, in some modern browsers, HTML5 History Management is used to support changing the URL's path without reloading the page.
  This plugin also provides a method to navigate to a URL safely, that will use HTML5 History Management to avoid a page load.
  Everything degrades gracefully, and supports RESTful client development.

  Browser Support:
  Chrome  - Any recent version of Chrome supports everything.
  Safari  - Any recent version of Safari supports everything.
  Firefox - Newer versions of Firefox support the hashchange event
            Firefox 4 betas also support HTML5 History Management
  Internet Explorer - IE8 supports hashchange
                      IE6 and 7 receive inferior hashchange support through a polling interval.
  Others  - Other modern browsers probably support some subset of features.

  This plugin was authored by Ben Cherry (bcherry@gmail.com), and is released under an MIT License (do what you want with it).
  Some of the code in this plugin was adapted from Modernizr, which is also available under an MIT License.
*/

var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

(function($) {
  var my;
  $.fn.pathchange = function(handler) {
    if (handler) {
      return this.bind("pathchange", handler);
    } else {
      return this.trigger("pathchange");
    }
  };
  my = $.pathchange = {
    options: {
      useHistory: true,
      useHashchange: true,
      pollingInterval: 25,
      interceptLinks: true,
      disableHashLinks: true
    },
    historyReady: false,
    init: function(options) {
      var lastHash;
      $.extend(my.options, options);
      if (my.options.useHistory && my.detectHistorySupport()) {
        $(window).bind("popstate", function(e) {
          if (my.historyReady) {
            $(window).trigger("pathchange");
          }
          return my.historyReady = true;
        });
      }
      if (my.options.useHashchange) {
        $(window).bind("hashchange", function(e) {
          return $(window).trigger("pathchange");
        });
        if (!my.detectHashchangeSupport()) {
          lastHash = window.location.hash;
          return setInterval(function() {
            if (lastHash !== window.location.hash) {
              $(window).trigger("hashchange");
              return lastHash = window.location.hash;
            }
          }, my.options.pollingInterval);
        }
      }
    },
    detectHistorySupport: function() {
      return !!(window.history && history.pushState);
    },
    detectHashchangeSupport: function() {
      var isSupported;
      isSupported = __indexOf.call(window, "onhashchange") >= 0;
      if (!isSupported && window.setAttribute) {
        window.setAttribute("onhashchange", "return;");
        isSupported = typeof window.onhashchange === "function";
      }
      return isSupported;
    }
  };
  return true;
})(jQuery);

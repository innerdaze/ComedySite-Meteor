/*
  jQuery Foundation Magellan 0.0.1
  http://foundation.zurb.com
  Copyright 2012, ZURB
  Free to use under the MIT license.
  http://www.opensource.org/licenses/mit-license.php
*/

$.fn.lsdAffix = function(options) {
  var $expedition, $fixedMagellan, defaults;
  $fixedMagellan = $('[data-magellan-expedition=fixed]');
  defaults = {
    threshold: $fixedMagellan.length ? $fixedMagellan.outerHeight(true) : 25,
    activeClass: 'active'
  };
  options = $.extend({}, defaults, options);
  $expedition = $('[data-magellan-expedition]');
  $expedition.find('[data-magellan-arrival]:first').addClass($expedition.attr('data-magellan-active-class' || options.activeClass));
  $fixedMagellan.on('magellan.update-position', function() {
    var $el;
    $el = $(this);
    $el.data("magellan-fixed-position", "");
    return $el.data("magellan-top-offset", "");
  });
  $fixedMagellan.trigger('magellan.update-position');
  $(window).on('resize.magellan', function() {
    return $fixedMagellan.trigger('magellan.update-position');
  });
  return $(window).on('scroll.magellan', function() {
    var windowScrollTop;
    windowScrollTop = $(window).scrollTop();
    return $fixedMagellan.each(function() {
      var fixed_position, width;
      $expedition = $(this);
      if ($expedition.data("magellan-top-offset") === "") {
        $expedition.data("magellan-top-offset", $expedition.offset().top);
      }
      fixed_position = (windowScrollTop + options.threshold) > $expedition.data("magellan-top-offset");
      if ($expedition.data("magellan-fixed-position") !== fixed_position) {
        $expedition.data("magellan-fixed-position", fixed_position);
        if (fixed_position) {
          if ($expedition.css('box-sizing') === 'border-box') {
            width = $expedition.css('width');
          } else {
            width = $expedition.width();
          }
          return $expedition.css({
            position: "fixed",
            top: 0,
            width: width
          });
        } else {
          return $expedition.removeAttr('style');
        }
      }
    });
  });
};

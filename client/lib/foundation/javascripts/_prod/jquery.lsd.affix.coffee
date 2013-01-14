###
  jQuery Foundation Magellan 0.0.1
  http://foundation.zurb.com
  Copyright 2012, ZURB
  Free to use under the MIT license.
  http://www.opensource.org/licenses/mit-license.php
###

# jslint unparam: true, browser: true, indent: 2

$.fn.lsdAffix = (options) ->

  $fixedMagellan = $ '[data-magellan-expedition=fixed]'
  defaults =
    threshold   : if $fixedMagellan.length then $fixedMagellan.outerHeight true else 25
    activeClass : 'active'

  options = $.extend {}, defaults, options

  # Set starting point as the current destination
  $expedition = $ '[data-magellan-expedition]'
  $expedition.find('[data-magellan-arrival]:first')
    .addClass $expedition.attr 'data-magellan-active-class' or options.activeClass

  # Update fixed position
  $fixedMagellan.on 'magellan.update-position', () ->
    $el = $ this
    $el.data "magellan-fixed-position",""
    $el.data "magellan-top-offset", ""

  $fixedMagellan.trigger 'magellan.update-position'

  $(window).on 'resize.magellan', () ->
    $fixedMagellan.trigger 'magellan.update-position'

  $(window).on 'scroll.magellan', () ->
    windowScrollTop = $(window).scrollTop()
    $fixedMagellan.each () ->
      $expedition = $ this
      if $expedition.data("magellan-top-offset") is ""
        $expedition.data "magellan-top-offset", $expedition.offset().top

      fixed_position = (windowScrollTop + options.threshold) > $expedition.data "magellan-top-offset"
      if $expedition.data("magellan-fixed-position") isnt fixed_position
        $expedition.data "magellan-fixed-position", fixed_position
        if fixed_position
          if $expedition.css('box-sizing') is 'border-box'
            width = $expedition.css 'width'
          else
            width = $expedition.width()

          $expedition.css
            position: "fixed"
            top     : 0
            width   : width
        else
          $expedition.removeAttr 'style'
#          $expedition.css
#            position: ""
#            top     : ""

Template.dom_scripts.rendered = () ->
    'use strict'

    $doc = $(document)
    Modernizr = window.Modernizr

    if $.fn.foundationAlerts            then $doc.foundationAlerts() else null
    if $.fn.foundationButtons           then $doc.foundationButtons() else null
    if $.fn.foundationAccordion         then $doc.foundationAccordion() else null
    if $.fn.foundationNavigation        then $doc.foundationNavigation() else null
    if $.fn.foundationTopBar            then $doc.foundationTopBar() else null
    if $.fn.foundationCustomForms       then $doc.foundationCustomForms() else null
    if $.fn.foundationMediaQueryViewer  then $doc.foundationMediaQueryViewer() else null
    if $.fn.foundationTabs              then $doc.foundationTabs callback : $.foundation.customForms.appendCustomMarkup else null
    if $.fn.foundationTooltips          then $doc.foundationTooltips() else null
#    if $.fn.foundationMagellan          then $doc.foundationMagellan() else null
    if $.fn.foundationClearing          then $doc.foundationClearing() else null
    if $.fn.lsdAffix                    then $doc.lsdAffix() else null
    if $.fn.placeholder                 then $('input, textarea').placeholder() else null

    # UNCOMMENT THE LINE YOU WANT BELOW IF YOU WANT IE8 SUPPORT AND ARE USING .block-grids
    # $('.block-grid.two-up>li:nth-child(2n+1)').css({clear: 'both'});
    # $('.block-grid.three-up>li:nth-child(3n+1)').css({clear: 'both'});
    # $('.block-grid.four-up>li:nth-child(4n+1)').css({clear: 'both'});
    # $('.block-grid.five-up>li:nth-child(5n+1)').css({clear: 'both'});

    # Hide address bar on mobile devices (except if #hash present, so we don't mess up deep linking).
    if Modernizr.touch && !window.location.hash
      $(window).load () ->
        setTimeout () ->
          window.scrollTo 0, 1
        , 0

    # initialize plugins
    # $.fn.foundationMagellan()
    $.fn.lsdAffix
      threshold: 0

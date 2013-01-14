
Template.dom_scripts.rendered = function() {
  'use strict';

  var $doc, Modernizr;
  $doc = $(document);
  Modernizr = window.Modernizr;
  if ($.fn.foundationAlerts) {
    $doc.foundationAlerts();
  } else {
    null;
  }
  if ($.fn.foundationButtons) {
    $doc.foundationButtons();
  } else {
    null;
  }
  if ($.fn.foundationAccordion) {
    $doc.foundationAccordion();
  } else {
    null;
  }
  if ($.fn.foundationNavigation) {
    $doc.foundationNavigation();
  } else {
    null;
  }
  if ($.fn.foundationTopBar) {
    $doc.foundationTopBar();
  } else {
    null;
  }
  if ($.fn.foundationCustomForms) {
    $doc.foundationCustomForms();
  } else {
    null;
  }
  if ($.fn.foundationMediaQueryViewer) {
    $doc.foundationMediaQueryViewer();
  } else {
    null;
  }
  if ($.fn.foundationTabs) {
    $doc.foundationTabs({
      callback: $.foundation.customForms.appendCustomMarkup
    });
  } else {
    null;
  }
  if ($.fn.foundationTooltips) {
    $doc.foundationTooltips();
  } else {
    null;
  }
  if ($.fn.foundationClearing) {
    $doc.foundationClearing();
  } else {
    null;
  }
  if ($.fn.lsdAffix) {
    $doc.lsdAffix();
  } else {
    null;
  }
  if ($.fn.placeholder) {
    $('input, textarea').placeholder();
  } else {
    null;
  }
  if (Modernizr.touch && !window.location.hash) {
    $(window).load(function() {
      return setTimeout(function() {
        return window.scrollTo(0, 1);
      }, 0);
    });
  }
  return $.fn.lsdAffix({
    threshold: 0
  });
};


Template.left_side.rendered = function() {
  var $selector1, $selector2, $selector3, $selector5, events;
  $selector1 = $('#topMenu');
  events = 'click.fndtn';
  if ($selector1.length > 0) {
    $selector1.css("margin-top", $selector1.height() * -1);
  }
  $selector2 = $('#sidebarButton');
  if ($selector2.length > 0) {
    $('#sidebarButton').on(events, function(e) {
      e.preventDefault();
      return $('body').toggleClass('active');
    });
  }
  $selector3 = $('#menuButton');
  if ($selector3.length > 0) {
    $('#menuButton').on(events, function(e) {
      e.preventDefault();
      return $('body').toggleClass('active-menu');
    });
  }
  $selector5 = $('#switchPanels');
  if ($selector5.length > 0) {
    $('#switchPanels dd').on(events, function(e) {
      var switchToIndex, switchToPanel;
      e.preventDefault();
      switchToPanel = $(this).children('a').attr('href');
      switchToIndex = $(switchToPanel).index();
      $(this).toggleClass('active').siblings().removeClass('active');
      return $(switchToPanel).parent().css("left", switchToIndex * (-100) + '%');
    });
  }
  return $('#nav li a').on(events, function(e) {
    var $target, href;
    e.preventDefault();
    href = $(this).attr('href');
    $target = $(href);
    return $('html, body').animate({
      scrollTop: $target.offset().top
    }, 300);
  });
};

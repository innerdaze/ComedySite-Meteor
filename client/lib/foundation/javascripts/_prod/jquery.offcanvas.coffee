Template.left_side.rendered = () ->
  # Set the negative margin on the top menu for slide-menu pages
  $selector1 = $ '#topMenu'
  events = 'click.fndtn'

  if $selector1.length > 0 then $selector1.css "margin-top", $selector1.height() * -1

  # Watch for clicks to show the sidebar
  $selector2 = $ '#sidebarButton'

  if $selector2.length > 0
    $('#sidebarButton').on events, (e) ->
      e.preventDefault()
      $('body').toggleClass 'active'

  # Watch for clicks to show the menu for slide-menu pages
  $selector3 = $ '#menuButton'

  if $selector3.length > 0
    $('#menuButton').on events, (e) ->
      e.preventDefault()
      $('body').toggleClass 'active-menu'

  # # Adjust sidebars and sizes when resized
  # $(window).resize () ->
  #   # if (!navigator.userAgent.match(/Android/i)) $('body').removeClass('active');
  #   $selector4 = $('#topMenu')
  #  if $selector4.length > 0 then $selector4.css "margin-top", $selector4.height() * -1

  # Switch panels for the paneled nav on mobile
  $selector5 = $ '#switchPanels'

  if $selector5.length > 0
    $('#switchPanels dd').on events, (e) ->
      e.preventDefault()
      switchToPanel = $(this).children('a').attr 'href'
      switchToIndex = $(switchToPanel).index()
      $(this).toggleClass('active').siblings().removeClass 'active'
      $(switchToPanel).parent().css "left", switchToIndex * (-100) + '%'

  $('#nav li a').on events, (e) ->
    e.preventDefault()

    href    = $(this).attr 'href'
    $target = $ href

    $('html, body').animate
      scrollTop : $target.offset().top
    , 300
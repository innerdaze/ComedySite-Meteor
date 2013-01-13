_.extend Template.page_controller,

  displayPage : () ->

    PageTemplate = Meteor.PageController.getActivePageTemplate()

    if not PageTemplate

      displayTemplate = 'page_404'

      title = 'Page Not Found. Sorry!'

    else

      if PageTemplate.init then PageTemplate.init() else null

      if PageTemplate.getTitle then title = PageTemplate.getTitle()

      displayTemplate = PageTemplate.displayTemplate


    # Temp - Set the document title
    document.title  = 'Comedy Site - ' + title

    Template[displayTemplate].PageDataTemplate = PageTemplate

    Template[displayTemplate]()


  events :
    'click .navlink': (event) ->
      event.preventDefault()

  #      get the path from the link
      reg       = /.+?\:\/\/.+?(\/.+?)(?:#|\?|$)/
      regResult = reg.exec(event.currentTarget.href)
      pathname  = if regResult then regResult[1] else '/'

  #      set the session variable
      Session.set 'pageUrl', pathname
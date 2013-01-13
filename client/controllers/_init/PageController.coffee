Meteor.define 'Meteor.PageController',

  extends   : 'Meteor.Controller'
  singleton : true

  getPageController: (pageIndex) ->
    if pageIndex?
      pageIndex = @convertPageIndex pageIndex
      Meteor.Page[pageIndex.capitalize()]


  getActivePageController: ->
    this.getPageController Session.get 'pageIndex'


  getPageTemplate: (pageIndex) ->
    if pageIndex?
      pageIndex = @convertPageIndex pageIndex
      Template[pageIndex]


  getActivePageTemplate: ->
    activePageIndex = @getActivePageIndex()

    if activePageIndex
      @getPageTemplate activePageIndex


  getActivePageIndex: ->
    @convertPageIndex Session.get 'pageIndex'


  convertPageIndex: (pageIndex) ->
    if pageIndex?
      if pageIndex[0] == "/"
        pageIndex = pageIndex.substring 1, pageIndex.length

      if pageIndex == ''
        pageIndex = 'index'

    pageIndex
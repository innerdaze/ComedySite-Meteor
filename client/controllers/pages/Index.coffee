Meteor.define 'Meteor.Page.Index',

  extends : 'Meteor.PageController'

  init: ->
    Session.set 'current-authors-selector', {}
    Session.set 'current-posts-selector', {}

  getAuthorsSelector: -> {}
Meteor.define 'Meteor.Page.Author',
  extends : 'Meteor.PageController',

  getPostsSelector: ->
    AuthorEntity = Meteor.AuthorController.getAuthor()

    if AuthorEntity then {AuthorId: AuthorEntity.AuthorId}


###
  @class AuthorController
###
Meteor.define 'Meteor.AuthorController',

  extends: 'Meteor.Controller'

  constructor: ->
    Meteor.autorun ->
      authorUrl = Session.get 'authorUrl'

      if authorUrl and Authors
        author = Authors.findOne
          SeoUrl: authorUrl

        if author
          Session.set 'authorId', author._id

          Session.set 'currentAuthorsSelector',
            _id: authorId

          Session.set 'currentPostsSelector',
            AuthorId: authorId


  ###
    Retrieve a single Author using the SeoUrl as an index
    @return Author
  ###
  getAuthor : (selector) ->
    if typeof(selector) == 'string'
      selector = {_id: selector}

    if Authors then Authors.findOne(selector or Session.get 'currentAuthorsSelector')


  ###
    Retrieve a set of Authors
    @return Authors
  ###
  getAuthors : ->
    debugger
    if Authors then Authors.find Session.get 'currentAuthorsSelector' or {}


  ###
    Retrieve the posts related to the currently selected author
    @return Posts
  ###
  getPosts : ->
    author = @getAuthor()
    if author and Posts
      posts = Posts.find Session.get 'currentPostsSelector'

Meteor.create Meteor.AuthorController
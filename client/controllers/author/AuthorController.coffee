###
  @class AuthorController
###
Meteor.define 'Meteor.AuthorController',

  extends: 'Meteor.Controller'

  ###
    Retrieve a single Author using the SeoUrl as an index
    @return Author
  ###
  getAuthor : ->
    if not (@selectedAuthor and Session.get 'authorId' isnt @selectedAuthor.SeoUrl)
      if Authors
        @selectedAuthor = Authors.findOne
          SeoUrl: Session.get 'authorId'

    @selectedAuthor


  getPosts : ->
    author = @getAuthor()
    if author and Posts
      posts = Posts.find(
        AuthorId: author.AuthorId
      ).fetch()
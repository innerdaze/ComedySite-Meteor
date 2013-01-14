###
  @class PostController
###
Meteor.define 'Meteor.PostController',

  extends: 'Meteor.Controller'

  constructor: ->
    Meteor.autorun ->
      postUrl = Session.get 'postUrl'

      if postUrl and Posts
        post = Posts.findOne
          SeoUrl: postUrl

        if post
          Session.set 'postId', post._id


  getPosts: (selector) ->
    if Posts
      Posts.find selector or Session.get('currentPostsSelector') or {},
        sort:
          name: 1


  ###
    Gets the selected post from the Session
    @return Post
  ###
  getPost : (id) ->
    if Posts
      Posts.findOne
        _id: id


Meteor.create Meteor.PostController
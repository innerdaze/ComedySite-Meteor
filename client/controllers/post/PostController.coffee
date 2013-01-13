###
  @class PostController
###
Meteor.define 'Meteor.PostController',

  extends: 'Meteor.Controller'

  ###
    Gets the selected post from the Session
    @return Post
  ###
  getPost : () ->
    if not (@selectedPost and Session.get 'postId' isnt @selectedPost.SeoUrl)
      if Posts
        @selectedPost = Posts.findOne
          SeoUrl: Session.get 'postId'

    @selectedPost
/*
  @class PostController
*/

Meteor.define('Meteor.PostController', {
  "extends": 'Meteor.Controller',
  /*
      Gets the selected post from the Session
      @return Post
  */

  getPost: function() {
    if (!(this.selectedPost && Session.get('postId' !== this.selectedPost.SeoUrl))) {
      if (Posts) {
        this.selectedPost = Posts.findOne({
          SeoUrl: Session.get('postId')
        });
      }
    }
    return this.selectedPost;
  }
});

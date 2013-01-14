
_.extend(Template.post, {
  id: 'post',
  entityController: Meteor.PostController,
  displayTemplate: 'index',
  getContentForViewer: function() {
    return Template.post_view();
  },
  getTitle: function() {
    var post;
    post = this.entityController.getPost();
    if (post) {
      return post.Headline;
    }
  }
});

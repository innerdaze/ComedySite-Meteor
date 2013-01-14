
_.extend(Template.author_posts, {
  entityController: Meteor.AuthorController,
  getPosts: function() {
    return Template.post_list({
      posts: Meteor.AuthorController.getPosts()
    });
  }
});

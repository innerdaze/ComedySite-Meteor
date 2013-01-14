
_.extend(Template.post_view, {
  getAuthor: function(authorId) {
    return Authors.findOne({
      AuthorId: authorId
    });
  },
  getAuthorInfo: function(authorId, property) {
    return Authors.findOne({
      AuthorId: authorId
    })[property];
  },
  getPost: function() {
    return Meteor.PostController.getPost();
  }
});

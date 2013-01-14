
Template.post_snippet.getAuthor = function(authorId) {
  return Authors.findOne({
    AuthorId: authorId
  });
};

Template.post_snippet.getAuthorInfo = function(authorId, property) {
  return Authors.findOne({
    AuthorId: authorId
  })[property];
};

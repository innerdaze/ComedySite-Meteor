
_.extend(Template.author, {
  id: 'author',
  entityController: Meteor.AuthorController,
  displayTemplate: 'index',
  getContentForViewer: function() {
    return Template.author();
  },
  getAuthor: function() {
    return Meteor.AuthorController.getAuthor();
  },
  getTitle: function() {
    var author;
    author = this.entityController.getAuthor();
    if (author) {
      return author.FullName;
    }
  }
});

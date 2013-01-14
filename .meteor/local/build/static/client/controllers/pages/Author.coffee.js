
Meteor.define('Meteor.Page.Author', {
  "extends": 'Meteor.PageController',
  getPostsSelector: function() {
    var AuthorEntity;
    AuthorEntity = Meteor.AuthorController.getAuthor();
    if (AuthorEntity) {
      return {
        AuthorId: AuthorEntity.AuthorId
      };
    }
  }
});

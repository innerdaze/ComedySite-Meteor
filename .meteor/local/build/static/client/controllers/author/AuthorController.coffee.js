/*
  @class AuthorController
*/

Meteor.define('Meteor.AuthorController', {
  "extends": 'Meteor.Controller',
  /*
      Retrieve a single Author using the SeoUrl as an index
      @return Author
  */

  getAuthor: function() {
    if (!(this.selectedAuthor && Session.get('authorId' !== this.selectedAuthor.SeoUrl))) {
      if (Authors) {
        this.selectedAuthor = Authors.findOne({
          SeoUrl: Session.get('authorId')
        });
      }
    }
    return this.selectedAuthor;
  },
  getPosts: function() {
    var author, posts;
    author = this.getAuthor();
    if (author && Posts) {
      return posts = Posts.find({
        AuthorId: author.AuthorId
      }).fetch();
    }
  }
});

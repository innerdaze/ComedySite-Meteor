
_.extend(Template.post_list, {
  entityController: Meteor.PostController,
  getPosts: function() {
    var postSelector, posts;
    if (Template.post_list.posts) {
      posts = Template.post_list.posts;
    } else if (Posts) {
      postSelector = Template.post_list.getPostsSelector();
      posts = Posts.find(postSelector, {
        sort: {
          name: 1
        }
      });
    }
    return posts;
  },
  /*
      Doesn't work - returns string
  */

  getContextController: function(dataType) {
    return Meteor.PageController.getPageController(Session.get('pageIndex'));
  },
  /*
      Lol I shouldn't have made it so complex, but I guess the less templates to compile, the better
      I think this should ask the AuthorPageController (which I will rename) for the PostsSelector as the context will
      denote it's usage - but maybe it should get filters from the AuthorView (also rename) as well
  */

  getPostsSelector: function() {
    var contextController;
    contextController = Template.post_list.getContextController();
    return contextController.getPostsSelector();
  }
});

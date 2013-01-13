_.extend Template.author_posts,

  entityController: Meteor.AuthorController

  getPosts : ->
    Template.post_list({posts: Meteor.AuthorController.getPosts()})
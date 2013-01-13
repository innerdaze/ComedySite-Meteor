_.extend Template.post,

  id: 'post'

  entityController: Meteor.PostController

  displayTemplate: 'index'

  getContentForViewer: ->
    Template.post_view()

  getTitle : ->
    post = @entityController.getPost()
    if post then post.Headline



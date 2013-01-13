_.extend Template.author,

  id: 'author'

  entityController: Meteor.AuthorController

  displayTemplate: 'index'

  getContentForViewer: ->
    Template.author()

  getAuthor: ->
    Meteor.AuthorController.getAuthor()

  getTitle : ->
    author = @entityController.getAuthor()
    if author then author.FullName
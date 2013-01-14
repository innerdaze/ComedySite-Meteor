Template.post_snippet.getAuthor = (authorId) ->
  Meteor.AuthorController.getAuthor authorId

Template.post_snippet.getAuthorInfo = (authorId, property) ->
  Meteor.AuthorController.getAuthor(authorId)[property]
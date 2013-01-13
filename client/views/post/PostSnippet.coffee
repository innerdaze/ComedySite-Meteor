Template.post_snippet.getAuthor = (authorId) ->
  Authors.findOne
    AuthorId: authorId

Template.post_snippet.getAuthorInfo = (authorId, property) ->
  Authors.findOne(
    AuthorId: authorId
  )[property]
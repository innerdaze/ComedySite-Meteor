_.extend Template.post_view,

  getAuthor : (authorId) ->
    Authors.findOne
      AuthorId: authorId

  getAuthorInfo : (authorId, property) ->
    Authors.findOne(
      AuthorId: authorId
    )[property]

  getPost: ->
    Meteor.PostController.getPost Session.get 'postId'

#Template.article_view.events =
#  'keyup #document-text': (e) ->
#    # @_id should work here, but it doesn't
#    sel = _id: Session.get("article_id")
#    mod = $set: text: $('#document-text').val()
#    Articles.update(sel, mod)
#ArticlesRouter = Backbone.Router.extend(
#  routes:
#    ":article_id": "main"
#
#  main: (article_id) ->
#    Session.set "article_id", article_id
#
#  setArticle: (article_id) ->
#    @navigate(article_id, true)
#)
#
#Router = new ArticlesRouter
#
#Meteor.startup ->
#  Backbone.history.start pushState: true

Meteor.startup ->
  if Meteor.FriendTweets.find().count() is 0
    Meteor.FriendTweets.insert
      Author  : "Dave Daveson",
      Message : "Random tweet about stuff..."
    Meteor.FriendTweets.insert
      Author  : "James Jameson"
      Message : 'Another random tweet with a <a href="#">@mention</a>'
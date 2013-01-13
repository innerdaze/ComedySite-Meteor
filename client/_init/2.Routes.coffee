###
  MainApp Router
###
AppRouter = Backbone.Router.extend
  routes:
    'post/:seo_url'   : 'getPost'
    'author/:seo_url' : 'getAuthor'
    '*path'           : 'main'

  main: (url_path) ->
    Session.set 'pageIndex', url_path

  getPost: (seo_url) ->
    Session.set 'postId', seo_url
    Session.set 'pageIndex', 'post'

  getAuthor: (seo_url) ->
    Session.set 'authorId', seo_url
    Session.set 'pageIndex', 'author'

Router = new AppRouter

###
  History Support
###
Backbone.history.start
  pushState: true

if Session.get('pageUrl') isnt window.location.pathname
  Session.set 'pageUrl', window.location.pathname

###
  Navigation - Listen for changes to Session.page_url and echo to Router
###
Meteor.autorun (handle) ->
  page_url = Session.get 'pageUrl'

#  reg = /.+?\:\/\/.+?(\/.+?)(?:#|\?|$)/
#  regResult = reg.exec(page_url)

  Router.navigate page_url, true

###
  Pathchange Support
###
$ () ->
  $.pathchange.init() # setup event listeners, etc.

  $(window).pathchange(() ->
    if Session.get('pageUrl') isnt window.location.pathname
      Session.set 'pageUrl', window.location.pathname
  ).trigger "pathchange"
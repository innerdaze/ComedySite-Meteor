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
    Session.set 'postUrl', seo_url
    Session.set 'pageIndex', 'post'

  getAuthor: (seo_url) ->
    Session.set 'authorUrl', seo_url
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
  Router.navigate Session.get('pageUrl'), true


###
  Pathchange Support
###
$ () ->
  $.pathchange.init() # setup event listeners, etc.

  $(window).pathchange(() ->
    if Session.get('pageUrl') isnt window.location.pathname
      Session.set 'pageUrl', window.location.pathname
  ).trigger "pathchange"
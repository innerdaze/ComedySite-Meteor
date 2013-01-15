/*
  MainApp Router
*/

var AppRouter, Router;

AppRouter = Backbone.Router.extend({
  routes: {
    'post/:seo_url': 'getPost',
    'author/:seo_url': 'getAuthor',
    '*path': 'main'
  },
  main: function(url_path) {
    return Session.set('pageIndex', url_path);
  },
  getPost: function(seo_url) {
    Session.set('postId', seo_url);
    return Session.set('pageIndex', 'post');
  },
  getAuthor: function(seo_url) {
    Session.set('authorId', seo_url);
    return Session.set('pageIndex', 'author');
  }
});

Router = new AppRouter;

/*
  History Support
*/


Backbone.history.start({
  pushState: true
});

if (Session.get('pageUrl') !== window.location.pathname) {
  Session.set('pageUrl', window.location.pathname);
}

/*
  Navigation - Listen for changes to Session.page_url and echo to Router
*/


Meteor.autorun(function(handle) {
  var page_url;
  page_url = Session.get('pageUrl');
  return Router.navigate(page_url, true);
});

/*
  Pathchange Support
*/


$(function() {
  $.pathchange.init();
  return $(window).pathchange(function() {
    if (Session.get('pageUrl') !== window.location.pathname) {
      return Session.set('pageUrl', window.location.pathname);
    }
  }).trigger("pathchange");
});

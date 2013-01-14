
Meteor.define('Meteor.PageController', {
  "extends": 'Meteor.Controller',
  singleton: true,
  getPageController: function(pageIndex) {
    if (pageIndex != null) {
      pageIndex = this.convertPageIndex(pageIndex);
      return Meteor.Page[pageIndex.capitalize()];
    }
  },
  getActivePageController: function() {
    return this.getPageController(Session.get('pageIndex'));
  },
  getPageTemplate: function(pageIndex) {
    if (pageIndex != null) {
      pageIndex = this.convertPageIndex(pageIndex);
      return Template[pageIndex];
    }
  },
  getActivePageTemplate: function() {
    var activePageIndex;
    activePageIndex = this.getActivePageIndex();
    if (activePageIndex) {
      return this.getPageTemplate(activePageIndex);
    }
  },
  getActivePageIndex: function() {
    return this.convertPageIndex(Session.get('pageIndex'));
  },
  convertPageIndex: function(pageIndex) {
    if (pageIndex != null) {
      if (pageIndex[0] === "/") {
        pageIndex = pageIndex.substring(1, pageIndex.length);
      }
      if (pageIndex === '') {
        pageIndex = 'index';
      }
    }
    return pageIndex;
  }
});

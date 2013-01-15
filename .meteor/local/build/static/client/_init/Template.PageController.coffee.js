
_.extend(Template.page_controller, {
  displayPage: function() {
    var PageTemplate, displayTemplate, title;
    PageTemplate = Meteor.PageController.getActivePageTemplate();
    if (!PageTemplate) {
      displayTemplate = 'page_404';
      title = 'Page Not Found. Sorry!';
    } else {
      if (PageTemplate.init) {
        PageTemplate.init();
      } else {
        null;
      }
      if (PageTemplate.getTitle) {
        title = PageTemplate.getTitle();
      }
      displayTemplate = PageTemplate.displayTemplate;
    }
    document.title = 'Comedy Site - ' + title;
    Template[displayTemplate].PageDataTemplate = PageTemplate;
    return Template[displayTemplate]();
  },
  events: {
    'click .navlink': function(event) {
      var pathname, reg, regResult;
      event.preventDefault();
      reg = /.+?\:\/\/.+?(\/.+?)(?:#|\?|$)/;
      regResult = reg.exec(event.currentTarget.href);
      pathname = regResult ? regResult[1] : '/';
      return Session.set('pageUrl', pathname);
    }
  }
});

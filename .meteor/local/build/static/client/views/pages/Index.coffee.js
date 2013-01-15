
_.extend(Template.index, {
  id: 'index',
  displayTemplate: 'index',
  getContentForViewer: function() {
    if (Template.index.PageDataTemplate.id === Template.index.id) {
      return Template.post_region();
    } else {
      return Template.index.PageDataTemplate.getContentForViewer();
    }
  },
  getTitle: function() {
    return 'Home';
  }
});

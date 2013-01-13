_.extend Template.index,

  id: 'index'

  displayTemplate: 'index'

  getContentForViewer: ->
    if Template.index.PageDataTemplate.id is Template.index.id
      Template.post_region()
    else
      Template.index.PageDataTemplate.getContentForViewer()


  getTitle : -> 'Home'
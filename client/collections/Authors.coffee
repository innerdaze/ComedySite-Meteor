Meteor.autosubscribe ->
  Meteor.subscribe 'authors', Session.get 'currentAuthorsSelector'
Meteor.autosubscribe ->
  Meteor.subscribe 'posts', Session.get 'currentPostsSelector'
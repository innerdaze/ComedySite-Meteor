
Meteor.startup(function() {
  if (Meteor.FriendTweets.find().count() === 0) {
    Meteor.FriendTweets.insert({
      Author: "Dave Daveson",
      Message: "Random tweet about stuff..."
    });
    return Meteor.FriendTweets.insert({
      Author: "James Jameson",
      Message: 'Another random tweet with a <a href="#">@mention</a>'
    });
  }
});

Meteor.startup ->
  Authors.remove {}
  if Authors.find().count() is 0
    Authors.insert
#      AuthorId  : 1
      FirstName : "Samuel"
      LastName  : "L. Jackson"
      FullName  : "Samuel L. Jackson"
      SeoUrl    : 'samuel-l-jackson'
    Authors.insert
#      AuthorId  : 2
      FirstName : "Latifah"
      LastName  : "Johnson"
      FullName  : "Latifah Johnson"
      SeoUrl    : 'latifah-johnson'


  Posts.remove {}
  if Posts.find().count() is 0

    authorId = Authors.findOne(
      FirstName: 'Samuel'
    )._id

    Posts.insert
      AuthorId      : authorId
      TimeAgo       : "3 Days"
      Headline	    : "I'm serious as a heart attack"
      LeadCopy	    : "Toast is hard to cook... so I use a maid."
      PrimaryContent: "The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee."
      HeroImageSrc  : '/dummy_images/hollande_jean_marc_ayrault.jpg'
      Type          : "A"
      SeoUrl        : 'path-of-a-righteous-man'
    Posts.insert
      AuthorId      : authorId
      TimeAgo       : "1 Day"
      Headline	    : "I can do that"
      LeadCopy	    : "Your bones don't break, mine do."
      PrimaryContent: "That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends."
      HeroImageSrc  : '/dummy_images/italian_man_an_untrained_eye.jpg'
      Type          : "B"
      SeoUrl        : 'your-dont-get-sick-but-i-do'

    debugger
    authorId = Authors.findOne(
      FirstName: 'Latifah'
    )._id

    Posts.insert
      AuthorId      : authorId
      TimeAgo       : "2 Hours"
      Headline	    : "Is she dead, yes or no?"
      LeadCopy	    : "Your bones don't break, mine do."
      PrimaryContent: "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?"
      HeroImageSrc  : '/dummy_images/laughing_amir_kuckovic.jpg'
      Type          : "C"
      SeoUrl        : 'glass-motherfuckin-house'
    Posts.insert
      AuthorId      : authorId
      TimeAgo       : "8 Hours"
      Headline	    : "Hold on to your butts"
      LeadCopy	    : "My money's in that office, right?"
      PrimaryContent: "If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?"
      HeroImageSrc: '/dummy_images/lee_rasmussen_korea.net.jpg'
      Type          : "D"
      SeoUrl        : 'ima-gonna-shoot-you-in-the-head-then'
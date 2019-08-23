# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
Family.destroy_all
Neighborhood.destroy_all
Event.destroy_all
User.destroy_all

u1 = User.create(username: "testuser", password: "test")
u2 = User.create(username: "bob", password: "bob")
u3 = User.create(username: "cob", password: "cob")
u4 = User.create(username: "dob", password: "dob")

c1 = Cat.create(name: "Crookshanks", breed: "Orange Tabby", description: "The size of a small lion.", user_id: u1.id)
c1.set_stats
c2 = Cat.create(name: "Bob", breed: "Bobcat", description: "This can't be legal.", user_id: u2.id)
c2.set_stats
c3 = Cat.create(name: "Ramses", breed: "Sphynx", description: "Wrinkled and regal.", user_id: u3.id)
c3.set_stats
c4 = Cat.create(name: "Precious", breed: "Exotic Shorthair", description: "Her face is rather smushed.", user_id: u4.id)
c4.set_stats
Cat.update(days: 0)



n1 = Neighborhood.create(name: "Graystone Heights", description: "increasingly swank", danger_rating: 2)

f1 = Family.create(name: "Johnson", description: "IDK man, they're average.", poshness: 2)
f2 = Family.create(name: "Franklin", description: "The snootiest family, with the highest grade wet food.", poshness: 3)
f3 = Family.create(name: "Smith", description: "They aren't fancy, but they sure do love cats.", poshness: 1)
f4 = Family.create(name: "Schubert", description: "They've got decent stuff.", poshness: 2)

n1.families << f1 << f2 << f3 << f4


n2 = Neighborhood.create(name: "Brighthope", description: "Hippies love cats.", danger_rating: 1)

f5 = Family.create(name: "Moonstar", description: "They're super into ethical, natural pet food. It's pretty good.", poshness: 2)
f6 = Family.create(name: "Albert", description: "They're vegan, and don't seem to get that cats are obligate carnivores. Still, they have some treats for you.", poshness: 1)
f7 = Family.create(name: "Neville", description: "These hippies love cats.", poshness: 2)
f8 = Family.create(name: "Poletti", description: "These hippies love cats.", poshness: 2)

n2.families << f5 << f6 << f7 << f8



n3 = Neighborhood.create(name: "Uptown", description: "So Posh", danger_rating: 1)

f9 = Family.create(name: "Cunningham", description: "The snootiest family, with the highest grade wet food.", poshness: 3)
f10 = Family.create(name: "Martinez", description: "The snootiest family, with the highest grade wet food.", poshness: 3)
f11 = Family.create(name: "Wilcox", description: "The snootiest family, with the highest grade wet food.", poshness: 3)
f12 = Family.create(name: "McGee", description: "They're not nearly snooty enough for this neighborhood - but maybe that's a good thing.", poshness: 2)

n3.families << f9 << f10 << f11 << f12



n4 = Neighborhood.create(name: "Wrongside", description: "Dirty alleyways abound.", danger_rating: 3)

f13 = Family.create(name: "Hodson", description: "All they have to offer is dinner scraps, but they're provided with love.", poshness: 1)
f14 = Family.create(name: "Coleman", description: "The cops are watching this place, but hey, you're a cat. None of your business.", poshness: 1)
f15 = Family.create(name: "Spence", description: "Mr. Spence is a beloved teacher at the local high school.", poshness: 1)
f16 = Family.create(name: "Whitakker", description: "A pretty average family with 2.5 kids and a very busted white picket fence.", poshness: 2)

n4.families << f13 << f14 << f15 << f16


c1.neighborhoods << n1
c2.neighborhoods << n4
c3.neighborhoods << n2
c4.neighborhoods << n3





c1.neighborhoods << n1 << n2


#n1 events
n1e1 = Event.create(title: "A coyote!", description: "What is that doing in this neighborhood???", hazard_rating: 3, lives_score: - 1, hunger_score: 0, scraggliness_score: + 1, cred_score: 0, posh_event: false)

n1e2 = Event.create(title: "Mud puddle...", description: "...Jump in it? Hell yeah!", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1, cred_score: 0, posh_event: false)

n1e3 = Event.create(title: "Broken bag of kibble!", description: "Dog food is still food and you're hungry.", hazard_rating: 0, lives_score: 0, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false)

n1c1 = Event.create(title: "A bright orange stray cat catches you unawares!", description: "They get the better of you, and you slink away in shame.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: - 1, posh_event: false)

n1c2 = Event.create(title: "You sneak up on a bright orange stray cat. Show them who's Top Cat around here!", description: "They flee in terror! The local neighborhood cats will remember this.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: + 1, posh_event: false)

n1p1 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They grab a broom and chase you away from the door. You bolt toward the street, easily dodging their clumsy attacks.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: 0, posh_event: true)

n1p2 = Event.create(title: "Cold shower!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), cred_score: 0, posh_event: true)

n1p3 = Event.create(title: "Sic 'em!", description: "Ack, what a filthy cat! You hear angry barking from inside the door as the home ownders sic their dog on you! You run, but not fast enough. Teeth snap down on your tail!", hazard_rating: 0, lives_score: - 1, hunger_score: - 1, scraggliness_score: 1, cred_score: 0, posh_event: true)

#n2 events

n2e1 = Event.create(title: "You see a tasty looking plant", description: "You take a bite and start to feel woozy", hazard_rating: 3, lives_score: - 1, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n2e2 = Event.create(title: "An excited toddler approaches you.", description: "They pet you with sticky hands. Gross...", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1, cred_score: 0, posh_event: false)

n2e3 = Event.create(title: "You find an open composting bin!", description: "Free fish head! Tasty.", hazard_rating: 0, lives_score: 0, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false)

n2c1 = Event.create(title: "A fat, odd smelling stray cat catches you unawares!", description: "They get the better of you, and you slink away in shame.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: - 1, posh_event: false)

n2c2 = Event.create(title: "You sneak up on a fat, odd smelling stray cat. Show them who's Top Cat around here!", description: "They flee in terror! The local neighborhood cats will remember this.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: + 1, posh_event: false)

n2p1 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They grab a broom and chase you away from the door. You bolt toward the street, easily dodging their clumsy attacks.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: 0, posh_event: true)

n2p2 = Event.create(title: "Cold shower!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), cred_score: 0, posh_event: true)

n2p3 = Event.create(title: "Sic 'em!", description: "Ack, what a filthy cat! You hear angry barking from inside the door as the home ownders sic their dog on you! You run, but not fast enough. Teeth snap down on your tail!", hazard_rating: 0, lives_score: - 1, hunger_score: - 1, scraggliness_score: (+ 1), cred_score: 0, posh_event: true)

#n3 events

n3e1 = Event.create(title: "Oncoming car!", description: "The car squashes your tail as it swerves to miss you. Ouch!", hazard_rating: 3, lives_score: - 1, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false)

n3e2 = Event.create(title: "Moving along the rooftops, you slip!", description: "You land in an open dumpster. You're safe, but what is that horrible smell?", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1, cred_score: 0, posh_event: false)

n3e3 = Event.create(title: "You pass a friendly old woman in the park", description: "She offers you a portion of her lunch. What luck!", hazard_rating: 0, lives_score: 0, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false)

n3c1 = Event.create(title: "A prissy stray cat catches you unawares!", description: "They get the better of you, and you slink away in shame.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: - 1, posh_event: false)

n3c2 = Event.create(title: "You sneak up on a prissy stray cat. Show them who's Top Cat around here!", description: "They flee in terror! The local neighborhood cats will remember this.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: + 1, posh_event: false)

n3p1 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They grab a broom and chase you away from the door. You bolt toward the street, easily dodging their clumsy attacks.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: 0, posh_event: true)

n3p2 = Event.create(title: "Cold shower!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), cred_score: 0, posh_event: true)

n3p3 = Event.create(title: "Sic 'em!", description: "Ack, what a filthy cat! You hear angry barking from inside the door as the home ownders sic their dog on you! You run, but not fast enough. Teeth snap down on your tail!", hazard_rating: 0, lives_score: - 1, hunger_score: - 1, scraggliness_score: (+ 1), cred_score: 0, posh_event: true)

#n4 events

n4e1 = Event.create(title: "You encounter a neighborhood dog. It growls menacingly!", description: "You run for your life, but it bites you!", hazard_rating: 3, lives_score: - 1, hunger_score: - 1, scraggliness_score: - 1, cred_score: 0, posh_event: false)

n4e2 = Event.create(title: "A group of children throw garbage at you!", description: "What is wrong with this neighborhood??", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 2, cred_score: 0, posh_event: false)

n4e3 = Event.create(title: "You find a mouse and begin to chase it!", description: "A well earned lunch. Nature can be cruel, but everyone has to eat.", hazard_rating: 0, lives_score: 0, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false)

n4c1 = Event.create(title: "A filthy stray cat catches you unawares!", description: "They get the better of you, and you slink away in shame.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1, cred_score: - 1, posh_event: false)

n4c2 = Event.create(title: "You sneak up on a filthy stray cat. Show them who's Top Cat around here!", description: "They flee in terror! The local neighborhood cats will remember this.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: + 1, posh_event: false)

n4p1 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They grab a broom and chase you away from the door. You bolt toward the street, easily dodging their clumsy attacks.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: 0, posh_event: true)

n4p2 = Event.create(title: "Cold shower!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), cred_score: 0, posh_event: true)

n4p3 = Event.create(title: "Sic 'em!", description: "Ack, what a filthy cat! You hear angry barking from inside the door as the home ownders sic their dog on you! You run, but not fast enough. Teeth snap down on your tail!", hazard_rating: 0, lives_score: - 1, hunger_score: - 1, scraggliness_score: (+ 1), cred_score: 0, posh_event: true)


n1.events << n1e1 << n1e2 << n1e3 << n1c1 << n1c2 << n1p1 << n1p2 << n1p3
n2.events << n2e1 << n2e2 << n2e3 << n2c1 << n2c2 << n2p1 << n2p2 << n2p3
n3.events << n3e1 << n3e2 << n3e3 << n3c1 << n3c2 << n3p1 << n3p2 << n3p3
n4.events << n4e1 << n4e2 << n4e3 << n4c1 << n4c2 << n4p1 << n4p2 << n4p3


n1.families << f1

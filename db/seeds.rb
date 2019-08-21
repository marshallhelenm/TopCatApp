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

c1 = Cat.create(name: "Crookshanks", breed: "Orange Tabby", description: "The size of a small lion.", user_id: u1.id)
c1.set_stats
c2 = Cat.create(name: "Bob", breed: "Bobcat", description: "This can't be legal.", user_id: u2.id)
c2.set_stats



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





f1.cats << c1



c1.neighborhoods << n1 << n2



e1 = Event.create(title: "A coyote!", description: "What is that doing in this neighborhood???", hazard_rating: 3, lives_score: - 1, hunger_score: 0, scraggliness_score: + 1)

e2 = Event.create(title: "Mud puddle...", description: "...Jump in it? Hell yeah!", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1)

e3 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), family_event: true)


n1.events << e1 << e3
n1.events << e2
n2.events << e1
n3.events << e1
n4.events << e1

n1.families << f1

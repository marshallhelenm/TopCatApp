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

c1 = Cat.create(name: "Crookshanks", breed: "Orange Tabby", description: "The size of a small lion.", user_id: u1.id)
c1.set_stats




f1 = Family.create(name: "Johnson", description: "IDK man, they're average.", poshness: "2")
f2 = Family.create(name: "Franklin", description: "The snootiest family, with the highest grade wet food.", poshness: "3")
f3 = Family.create(name: "Smith", description: "They aren't fancy, but they sure do love cats.", poshness: "1")
f4 = Family.create(name: "Schubert", description: "They've got decent stuff.", poshness: "2")
f5 = Family.create(name: "Moonstar", description: "Hippies have the best food.", poshness: "2")

f1.cats << c1

n1 = Neighborhood.create(name: "Ravenna", description: "increasingly swank", danger_rating: 2)
n2 = Neighborhood.create(name: "Queen Anne", description: "Hippies love cats.", danger_rating: 1)
n3 = Neighborhood.create(name: "Mercer Island", description: "So Posh", danger_rating: 1)
n4 = Neighborhood.create(name: "Wrongside", description: "Dirty alleyways abound.", danger_rating: 3)


c1.neighborhoods << n1 << n2

n1.families << f1 << f2
n2.families << f5
n3.families << f4
n4.families << f3





e1 = Event.create(title: "A coyote!", description: "What is that doing in this neighborhood???", hazard_rating: 3, lives_score: - 1, hunger_score: 0, scraggliness_score: - 1)

e2 = Event.create(title: "Mud puddle...", description: "...Jump in it?", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: - 1)

e3

n1.events << e1
n1.events << e2


n1.families << f1

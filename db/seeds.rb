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

u1 = User.create(username: "testuser")

c1 = Cat.create(name: "Crookshanks", breed: "Orange Tabby", description: "The size of a small lion.", user_id: u1.id)
c1.set_stats

f1 = Family.create(name: "Johnson", description: "IDK man, they're average.", poshness: "2")

f1.cats << c1

n1 = Neighborhood.create(name: "Ravenna", description: "increasingly swank", danger_rating: 2)

c1.neighborhoods << n1

e1 = Event.create(title: "A coyote!", description: "What is that doing in this neighborhood???", hazard_rating: 3, lives_score: - 1, hunger_score: 0, scraggliness_score: - 1)

n1.events << e1


n1.families << f1

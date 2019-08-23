# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'Faker'


Cat.destroy_all
Family.destroy_all
Neighborhood.destroy_all
Event.destroy_all
User.destroy_all



CATPICS = {
    "White Cat 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/18/white-cat-1732388__480.png",
    "White Cat 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/18/white-cat-1732386__480.png",
    "Tortie Cat 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/18/tortie-cat-1732385__480.png",
    "Tortie Cat 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/18/tortie-cat-1732384__480.png",
    "Orange Tabby 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/orange-tabby-cat-1732377__480.png",
    "Orange Tabby 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/orange-tabby-cat-1732376__480.png",
    "Gray Tabby 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/gray-tabby-cat-1732374__480.png",
    "Gray Tabby 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/gray-tabby-cat-1732372__480.png",
    "Calico Cat 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/calico-cat-1732371__480.png",
    "Calico Cat 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/calico-cat-1732370__480.png",
    "Black Cat 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/black-cat-1732366__480.png",
    "Black Cat 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/black-cat-1732367__480.png"
}

WORDS = ["active", "affectionate", "agile", "agreeable", "alert", "amusing", "anxious", "beautiful", "behavioral", "beloved", "best", "big", "bossy", "bright", "bright-eyed", "calico", "calm", "caring", "catlike", "cheerful", "chill", "chubby", "clean", "clever", "clumsy", "comic", "courageous", "crafty", "crazy", "crazy cute", "cuddly", "curious", "curled up", "cute", "daring", "delicate", "demanding", "dependent", "devoted", "dog-friendly", "domestic", "domesticated", "dominant", "eager-to-please", "likable", "little", "long-haired", "lovable", "loved", "loving", "loyal", "mellow", "merry", "mischievous", "moody", "muscular", "mysterious", "naughty", "needy", "neurotic", "neutered", "orange", "outgoing", "pampered", "part-dog", "people-friendly", "perfect", "personable", "picky", "playful", "pleasant", "pouncing", "precious", "pretty", "priceless", "protective", "purebred", "purrfect", "purring", "queenly", "quick", "quiet", "quirky", "ready-to-please", "rebellious", "regal", "relaxed", "rescued", "entertaining", "faithful", "family-friendly", "fast", "feline", "fixed", "fluffy", "foolish", "four-legged", "friendly", "frisky", "fun", "funny", "furry", "fuzzy", "gentle", "giant", "good", "good-natured", "goofy", "gorgeous", "graceful", "greedy", "grumpy", "handsome", "happy", "healthy", "heartwarming", "hilarious", "housebroken", "huggable", "hungry", "in good health", "independent", "instinctual", "intelligent", "jolly", "joyful", "keen", "kid-friendly", "kindhearted", "kingly", "laidback", "lazy", "rubbing", "scratchable", "scrawny", "scruffy", "sensitive", "shiny", "short-haired", "shy", "silly", "sleek", "sleepy", "smart", "sneaky", "snuggly", "soft", "spayed", "spoiled", "spoiled rotten", "spotted", "spry", "stray", "stubborn", "submissive", "sultry", "superior", "sure-footed", "sweet", "tabby", "temperamental", "territorial", "timid", "tortoiseshell", "tough", "trainable", "trained", "trustworthy", "trusty", "unique", "warm", "well-bred", "wild", "willing", "wonderful"] 








#######Users#######
def seed_users
    20.times do
        word = Faker::Creature::Animal.unique.name
        User.create(username: word, password: word)
    end
    puts "Successfully seeded Users!"
end


def seed_cats
    User.all.each do |user|
        cat = Cat.create(
            name: Faker::Creature::Cat.unique.name,
            breed: Faker::Creature::Cat.breed,
            description: "#{WORDS.sample} & #{WORDS.sample}",
            img_url: CATPICS.keys.sample
        )
        cat.set_stats
        user.cats << cat
    end
    puts "Successfully seeded Cats!"
end

def seed_relationships
    cats = Cat.all.collect do |cat| 
        cat.id 
    end
    Family.all.each do |fam|
        rel = Relationship.create(family_id: fam.id,
            cat_id: cats.sample,
            affection: rand(0..100)
        )
        cats.delete(rel.cat_id)
    end
    puts "Successfully seeded Relationships!"
end

def seed_territories
    Neighborhood.all.each do |neigh|
        cats = Cat.all.collect do |cat| 
            cat.id 
        end
        10.times do 
        Territory.create(cat_id: cats.shuffle!.pop, neighborhood_id: neigh.id, cat_status: rand(0..10))
        end
    end
    puts "Successfully seeded Territories!"
end


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


#####neighborhoods and families######

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



#####events#####

#n1 events
n1e1 = Event.create(title: "A coyote!", description: "What is that doing in this neighborhood???", hazard_rating: 3, lives_score: - 1, hunger_score: 0, scraggliness_score: + 1, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n1e2 = Event.create(title: "Mud puddle...", description: "...Jump in it? Hell yeah!", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n1e3 = Event.create(title: "Broken bag of kibble!", description: "Dog food is still food and you're hungry.", hazard_rating: 0, lives_score: 0, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n1c1 = Event.create(title: "A bright orange stray cat catches you unawares!", description: "They get the better of you, and you slink away in shame.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: - 1, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n1c2 = Event.create(title: "You sneak up on a bright orange stray cat. Show them who's Top Cat around here!", description: "They flee in terror! The local neighborhood cats will remember this.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: + 2, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n1p1 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They grab a broom and chase you away from the door. You bolt toward the street, easily dodging their clumsy attacks.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n1p2 = Event.create(title: "Cold shower!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n1p3 = Event.create(title: "Sic 'em!", description: "Ack, what a filthy cat! You hear angry barking from inside the door as the home ownders sic their dog on you! You run, but not fast enough. Teeth snap down on your tail!", hazard_rating: 0, lives_score: - 1, hunger_score: - 1, scraggliness_score: 1, cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

#n2 events

n2e1 = Event.create(title: "You see a tasty looking plant", description: "You take a bite and start to feel woozy", hazard_rating: 3, lives_score: - 1, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n2e2 = Event.create(title: "An excited toddler approaches you.", description: "They pet you with sticky hands. Gross...", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n2e3 = Event.create(title: "You find an open composting bin!", description: "Free fish head! Tasty.", hazard_rating: 0, lives_score: 0, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n2c1 = Event.create(title: "A fat, odd smelling stray cat catches you unawares!", description: "They get the better of you, and you slink away in shame.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: - 1, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n2c2 = Event.create(title: "You sneak up on a fat, odd smelling stray cat. Show them who's Top Cat around here!", description: "They flee in terror! The local neighborhood cats will remember this.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: + 2, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n2p1 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They grab a broom and chase you away from the door. You bolt toward the street, easily dodging their clumsy attacks.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n2p2 = Event.create(title: "Cold shower!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n2p3 = Event.create(title: "Sic 'em!", description: "Ack, what a filthy cat! You hear angry barking from inside the door as the home ownders sic their dog on you! You run, but not fast enough. Teeth snap down on your tail!", hazard_rating: 0, lives_score: - 1, hunger_score: - 1, scraggliness_score: (+ 1), cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

#n3 events

n3e1 = Event.create(title: "Oncoming car!", description: "The car squashes your tail as it swerves to miss you. Ouch!", hazard_rating: 3, lives_score: - 1, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n3e2 = Event.create(title: "Moving along the rooftops, you slip!", description: "You land in an open dumpster. You're safe, but what is that horrible smell?", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n3e3 = Event.create(title: "You pass a friendly old woman in the park", description: "She offers you a portion of her lunch. What luck!", hazard_rating: 0, lives_score: 0, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n3c1 = Event.create(title: "A prissy stray cat catches you unawares!", description: "They get the better of you, and you slink away in shame.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: - 1, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n3c2 = Event.create(title: "You sneak up on a prissy stray cat. Show them who's Top Cat around here!", description: "They flee in terror! The local neighborhood cats will remember this.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: + 2, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n3p1 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They grab a broom and chase you away from the door. You bolt toward the street, easily dodging their clumsy attacks.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n3p2 = Event.create(title: "Cold shower!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n3p3 = Event.create(title: "Sic 'em!", description: "Ack, what a filthy cat! You hear angry barking from inside the door as the home ownders sic their dog on you! You run, but not fast enough. Teeth snap down on your tail!", hazard_rating: 0, lives_score: - 1, hunger_score: - 1, scraggliness_score: (+ 1), cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

#n4 events

n4e1 = Event.create(title: "You encounter a neighborhood dog. It growls menacingly!", description: "You run for your life, but it bites you!", hazard_rating: 3, lives_score: - 1, hunger_score: - 1, scraggliness_score: - 1, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n4e2 = Event.create(title: "A group of children throw garbage at you!", description: "What is wrong with this neighborhood??", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 2, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n4e3 = Event.create(title: "You find a mouse and begin to chase it!", description: "A well earned lunch. Nature can be cruel, but everyone has to eat.", hazard_rating: 0, lives_score: 0, hunger_score: - 1, scraggliness_score: 0, cred_score: 0, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n4c1 = Event.create(title: "A filthy stray cat catches you unawares!", description: "They get the better of you, and you slink away in shame.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: + 1, cred_score: - 1, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n4c2 = Event.create(title: "You sneak up on a filthy stray cat. Show them who's Top Cat around here!", description: "They flee in terror! The local neighborhood cats will remember this.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: + 2, posh_event: false, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n4p1 = Event.create(title: "Git!", description: "Ack, what a filthy cat! They grab a broom and chase you away from the door. You bolt toward the street, easily dodging their clumsy attacks.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: 0, cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n4p2 = Event.create(title: "Cold shower!", description: "Ack, what a filthy cat! They throw a bucket of water at  you. You run away, marginally cleaner, though very displeased.", hazard_rating: 0, lives_score: 0, hunger_score: 0, scraggliness_score: (- 1), cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")

n4p3 = Event.create(title: "Sic 'em!", description: "Ack, what a filthy cat! You hear angry barking from inside the door as the home ownders sic their dog on you! You run, but not fast enough. Teeth snap down on your tail!", hazard_rating: 0, lives_score: - 1, hunger_score: - 1, scraggliness_score: (+ 1), cred_score: 0, posh_event: true, img_url: "https://cdn.pixabay.com/photo/2012/04/14/16/53/flower-34592_1280.png")


n1.events << n1e1 << n1e2 << n1e3 << n1c1 << n1c2 << n1p1 << n1p2 << n1p3
n2.events << n2e1 << n2e2 << n2e3 << n2c1 << n2c2 << n2p1 << n2p2 << n2p3
n3.events << n3e1 << n3e2 << n3e3 << n3c1 << n3c2 << n3p1 << n3p2 << n3p3
n4.events << n4e1 << n4e2 << n4e3 << n4c1 << n4c2 << n4p1 << n4p2 << n4p3


n1.families << f1


seed_users
seed_cats
seed_relationships
seed_territories
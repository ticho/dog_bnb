require 'faker'

# create 5 cities
5.times do
  City.create(city_name: Faker::GameOfThrones.city)
end

#create 15 dogsitters
15.times do
  Dogsitter.create(name: Faker::GameOfThrones.character,
                   city_id: City.all.sample.id)
end

#create 15 dogs
15.times do
  Dog.create(name: Faker::GameOfThrones.dragon,
             city_id: City.all.sample.id)
end

# need to come back on this later, a stroll should be able to have several dogs
# create 20 strolls, making sure that each the dog and dogsitter are in the same city
20.times do
  Stroll.create(dogsitter_id: Dogsitter.all.sample.id)
end

# populate the strolls with dogs from the same city
Stroll.all.each do |stroll|
  city_id = stroll.dogsitter.city_id
  city = City.find(city_id)
  stroll.dogs.push(city.dogs.sample(2))
  stroll.save
end

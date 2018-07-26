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

# create 20 strolls, making sure that each the dog and dogsitter are in the same city
20.times do
  dog = Dog.all.sample
  Stroll.create(dog_id: dog.id,
                dogsitter_id: dog.city.dogsitters.sample.id)
end

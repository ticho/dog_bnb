# dog_bnb

## Le pitch

> En cours de Bizeuness Model, tu devais créer une entreprise, et conquérir le monde avec tes SWOTs. À l'époque tu t'étais dit que ce serait une choeutte idée de faire une plateforme où des personnes pourraient promener les chiens, en échange de $€

## Models

## dogsitters
|Column|Type|
|------|----|
|name|string|
|city_id|reference|
### Associations
- belongs_to :city
- has_many :dogs, through: :strolls

## dogs
|Column|Type|
|------|----|
|name|string|
|city_id|reference|
### Associations
- belongs_to :city
- has_many :dogsitters, through: :strolls
- has_and_belongs_to_many :strolls


## strolls
|Column|Type|
|------|----|
|dog_id|reference|
|dogsitter_id|reference|
### Associations
- belongs_to :dogsitter
- has_and_belongs_to_many :dogs

## cities
|Column|Type|
|------|----|
|city_name|string|
### Associations
- has_many :dogsitters
- has_many :dogs

## dogs_strolls
|Column|Type|
|------|----|
|dog_id|reference|
|stroll_id|reference|
### Associations
- belongs_to :dog
- belongs_to :stroll

## Usage

```sh
$ bundle install
$ rails db:migrate
$ rails db:seed
```

## Test
To make sure that each dog and dogsitter from a stroll are from the same city
```ruby
Stroll.all.each do |stroll|
  stroll.dogs.each do |dog|
    if dog.city != stroll.dogsitter.city
      puts "Error"
    else
      puts "OK"
    end
  end
end
```

## Gems
We use :
- `faker` to populate the database with phony names, emails etc..

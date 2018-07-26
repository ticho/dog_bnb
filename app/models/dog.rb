class Dog < ApplicationRecord
  belongs_to :city
  has_many :dogsitters, through: :cities
  has_and_belongs_to_many :strolls
end

class Profile < ActiveRecord::Base
  has_many :food_likings
  has_many :liking_foods, through: :food_likings, source: :food

  has_many :food_dislikings
  has_many :disliking_foods, through: :food_dislikings, source: :food
end

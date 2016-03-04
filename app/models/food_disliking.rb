class FoodDisliking < ActiveRecord::Base
  belongs_to :profile
  belongs_to :food
end

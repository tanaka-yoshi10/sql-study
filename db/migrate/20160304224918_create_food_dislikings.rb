class CreateFoodDislikings < ActiveRecord::Migration
  def change
    create_table :food_dislikings do |t|
      t.belongs_to :profile, index: true, foreign_key: true
      t.belongs_to :food, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

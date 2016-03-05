class CreateGamePurchasings < ActiveRecord::Migration
  def change
    create_table :game_purchasings do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.datetime :purchased_at
      t.string :user_name

      t.timestamps null: false
    end
  end
end

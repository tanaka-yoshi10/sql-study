class CreatePurchasings < ActiveRecord::Migration
  def change
    create_table :purchasings do |t|
      t.belongs_to :book, index: true, foreign_key: true
      t.integer :age

      t.timestamps null: false
    end
  end
end

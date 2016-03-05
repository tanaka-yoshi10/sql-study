class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.belongs_to :department, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end

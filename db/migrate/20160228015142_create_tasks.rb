class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :project, index: true, foreign_key: true
      t.string :content
      t.date :due_date

      t.timestamps null: false
    end
  end
end

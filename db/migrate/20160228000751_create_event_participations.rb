class CreateEventParticipations < ActiveRecord::Migration
  def change
    create_table :event_participations do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :member, index: true, foreign_key: true
      t.boolean :canceled, null: false, default: false

      t.timestamps null: false
    end
  end
end

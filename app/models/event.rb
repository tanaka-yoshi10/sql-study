class Event < ActiveRecord::Base
  has_many :event_participations
  has_many :members, through: :event_participations
end

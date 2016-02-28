class Member < ActiveRecord::Base
  has_many :event_participations
  has_many :events, through: :event_participations
end

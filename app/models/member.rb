class Member < ActiveRecord::Base
  has_many :event_participations
  has_many :events, through: :event_participations

  scope :no_participation, -> {
    where("NOT EXISTS (SELECT * FROM event_participations ep WHERE ep.member_id = members.id AND ep.canceled = ?)", false)
  }
end

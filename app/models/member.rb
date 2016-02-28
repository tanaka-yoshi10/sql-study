class Member < ActiveRecord::Base
  has_many :event_participations
  has_many :events, through: :event_participations

  scope :no_participation, ->(event) {
    member_scope = event.members.where(event_participations: {canceled: false}).select(:id)
    where.not(id: member_scope)
  }
end

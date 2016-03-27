class Event < ActiveRecord::Base
  has_many :event_participations
  has_many :members, through: :event_participations

  def non_participated_members
    member_scope = members.where(event_participations: {canceled: false})
    Member.where.not(id: member_scope)
  end
end

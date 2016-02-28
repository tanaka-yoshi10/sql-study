class EventParticipation < ActiveRecord::Base
  belongs_to :event
  belongs_to :member

  before_save { self.canceled = false if canceled.blank?; true }
end

class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  
  has_many :signups, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :signups, source: :attendee

  scope :upcoming, -> { where("starts_on > ?", Date.today) }
  scope :past, -> { where("starts_on <= ?", Date.today) }
end

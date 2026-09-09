class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  
  has_many :signups, foreign_key: :attended_event_id
  has_many :attendees, through: :signups, source: :attendee

  def self.upcoming
    self.where("starts_on > ?", Date.today)
  end

  def self.past
    self.where("starts_on < ?", Date.today)
  end
end

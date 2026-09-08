class Signup < ApplicationRecord
  belongs_to :attendee, classname: "user"
  belongs_to :attended_event, classname: "event"
end

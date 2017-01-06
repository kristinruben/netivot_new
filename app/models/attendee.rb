class Attendee < ActiveRecord::Base
  has_many :events
  belongs_to :member

  # validate :first_name

  def is_attending?(event)
    event.attendees.include?(self)
  end

end

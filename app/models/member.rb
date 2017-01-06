class Member < ActiveRecord::Base

  has_one :attendee
  delegate :first_name, to: :attendee

  validate :first_name
  validate :email

end

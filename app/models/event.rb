class Event < ActiveRecord::Base

  # has_many :attendees, dependent: :destroy

  validates :name, presence: true
  validate :start_at_time
  validate :end_at_time
  validate :start_at_date
  validate :end_at_date
  validate :location_display_string
  validate :description
  validate :location_id
  validate :registration_link

end

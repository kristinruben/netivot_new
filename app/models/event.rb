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

  # 
  # attr_accessor :name, :start_at_time, :end_at_time, :start_at_date, :end_at_date,
  #   :location_display_string, :description, :location_id, :registration_link


end

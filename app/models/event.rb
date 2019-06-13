class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances
  scope :past, -> { where('date < ?', DateTime.current) }
  scope :upcoming, -> { where('date > ?', DateTime.current) }

  def unconfirmed_attendees
    self.attendees.where('confirmation == ?', false)
  end

  def confirmed_attendees
    self.attendees.where('confirmation == ?', true)
  end
end

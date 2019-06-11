class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

  def previous_events
    self.attended_events.where('date < ?', DateTime.current)
  end

  def upcoming_events
    self.attended_events.where('date > ?', DateTime.current)
  end

  def unconfirmed_events
    self.attended_events.where('confirmation == ?', false)
  end

  def confirmed_events
    self.attended_events.where('confirmation == ?', true)
  end

  def own_event?(event_id)
    event = Event.find_by(id: event_id)
    self.events.include?(event)
  end
end

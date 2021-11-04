# frozen_string_literal: true

class EventsUsers < ApplicationRecord
  attribute :event_id
  attribute :user_id

  validates :event_id, presence: true
  validates :user_id, presence: true

  belongs_to :event, inverse_of: :events_users
  belongs_to :user, inverse_of: :events_users

  def name
    "#{user.name} @ #{event.name}"
  end

  validates :event_id, presence: true,
                       format: { with: /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/ }
  validates :user_id, presence: true,
                      format: { with: /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/ }
end

class ServiceRequest < ApplicationRecord
  include AASM
  belongs_to :user
  has_secure_token

  aasm do
    state :pending, initial: true
    state :in_progress
    state :completed
    state :canceled
    state :overridden

    event :begin do
      transitions from: :pending, to: :in_progress
    end

    event :complete do
      transitions from: :in_progress, to: :completed
    end

    event :cancel do
      transitions from: [:in_progress, :pending], to: :canceled
    end

    event :override do
      transitions from: :canceled, to: :overridden
    end
  end
end

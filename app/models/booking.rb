class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :alibi

  enum :status, { pending: 0, approved: 1, declined: 2, cancelled: 3 }, default: :pending
end

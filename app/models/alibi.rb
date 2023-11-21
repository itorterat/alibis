class Alibi < ApplicationRecord
  belongs_to :user
  has_many :bookings

  enum status: { available: 0, archived: 1 }
end

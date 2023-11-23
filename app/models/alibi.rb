class Alibi < ApplicationRecord
  CATEGORIES = %w[family date journey speak cinema].freeze

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  enum :status, { available: 0, archived: 1 }, default: :available
  enum :goal, { ask: 0, offer: 1 }, default: :ask

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: statuses.keys }
  validates :category, inclusion: { in: CATEGORIES }
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :user, presence: true
  validates :goal, inclusion: { in: goals.keys }
end

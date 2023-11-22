class Alibi < ApplicationRecord
  CATEGORIES = %w[family date journey speak cinema].freeze

  belongs_to :user
  has_many :bookings, dependent: :destroy

  enum status: { available: 0, archived: 1 }

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: statuses.keys }
  # validates :image, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :user, presence: true
end

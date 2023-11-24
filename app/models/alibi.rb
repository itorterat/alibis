class Alibi < ApplicationRecord
  CATEGORIES = %w[family date journey speak cinema].freeze

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_category_title_and_content,
                  against: {
                    category: "A",
                    title: "C",
                    content: "D"
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  enum :status, { available: 0, archived: 1 }, default: :available
  enum :goal, { ask: 0, offer: 1 }, default: :ask
  enum :reservation_type, { solo: 0, multi: 1 }, default: :solo

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: statuses.keys }
  validates :category, inclusion: { in: CATEGORIES }
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :user, presence: true
  validates :goal, inclusion: { in: goals.keys }
  validates :reservation_type, inclusion: { in: reservation_types.keys }
end

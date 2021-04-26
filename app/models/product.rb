class Product < ApplicationRecord
  CATEGORIES = ["T-shirts", "Jeans", "Vestes", "Chaussures", "Jupes", "Pantalons", "Shorts"]
  belongs_to :user
  has_many :orders
  validates :name, presence: true
  validates :category, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category , :gender ],
    using: {
      tsearch: { prefix: true }
    }
end

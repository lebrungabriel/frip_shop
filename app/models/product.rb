class Product < ApplicationRecord
  CATEGORIES = ["T-shirts", "Jeans", "Vestes", "Chaussures", "Jupes", "Pantalons", "Shorts"]
  belongs_to :user
  has_many :order_items
  has_many :orders, through: :order_items
  validates :name, presence: true
  validates :category, presence: true
  enum gender: ["femme", "homme"]
  # has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category , :gender ],
    using: {
      tsearch: { prefix: true }
    }
end

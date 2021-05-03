class Product < ApplicationRecord
  CATEGORIES = ["T-shirts", "Jeans", "Vestes", "Chaussures", "Jupes", "Pantalons", "Shorts"]
  PRICES = [5, 10, 15, 20, 30, 50]
  COLORS = ["Rouge", "Bleu", "Jaune", "Vert", "Gris", "Blanc", "Noir", "Orange", "Rose"]
  SIZES = ["XS", "S", "M", "L", "XL", "XXL"]
  GENDER = ["Homme", "Femme"]
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :liked_items, dependent: :destroy
  has_many :orders, through: :order_items
  validates :name, presence: true
  validates :category, presence: true
  enum gender: ["femme", "homme"]
  # has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category , :gender, :price, :color, :size ],
    using: {
      tsearch: { prefix: true }
    }
end

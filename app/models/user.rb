class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :order_items
  has_many :orders, through: :order_items, source: :product
  has_many :purchased_products, through: :order_items, source: :product
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

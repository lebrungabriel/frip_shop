class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :product, dependent: :destroy
  belongs_to :order, optional: true
end

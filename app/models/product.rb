class Product < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :order_products, dependent: :destroy
  belongs_to :genre
end

class Product < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :order_products, dependent: :destroy
  belongs_to :genre

  attachment :image

  #validates :name, presence: true

  enum status: {
    販売中: 0,
    売切れ: 1

  }
end

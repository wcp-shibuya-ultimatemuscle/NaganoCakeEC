class Product < ApplicationRecord

  has_many :carts, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :customers, through: :carts
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :body, length: { maximum: 200 }
  validates :tax_out_price, presence: true

  enum status: {
    販売中: 0,
    売切れ: 1
  }


end

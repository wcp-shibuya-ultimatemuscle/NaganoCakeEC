class Product < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :order_products, dependent: :destroy
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :body, length: { maximum: 200 }
  validates :tax_out_price, presence: true

  #validates :type, inclusion: { in: selectBoxOptions("type") }
  #validates :status, inclusion: { in: [0,1] }

  enum status: {
    販売中: 0,
    売切れ: 1
  }


end

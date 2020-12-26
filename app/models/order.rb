class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :customer

  validates :payment, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  # 支払方法
  enum payment: {銀行振込: 0, クレジットカード: 1}
  # 注文ステータス
  enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}


end

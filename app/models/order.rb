class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :customer

  # 支払方法
  enum payment: {銀行振込: 0, クレジットカード: 1}
  # 注文ステータス
  enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送: 4}

end

class Receiver < ApplicationRecord
  belongs_to :customer

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true, length: { maximum: 80 }
  validates :name, presence: true

end

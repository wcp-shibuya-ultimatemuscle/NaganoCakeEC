class Genre < ApplicationRecord
  has_many :products

  enum is_active: {
    有効: 0,
    無効: 1
  }

end

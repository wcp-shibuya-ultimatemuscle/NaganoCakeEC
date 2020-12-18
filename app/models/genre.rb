class Genre < ApplicationRecord
  has_many :products

  self.inheritance_column = :_type_disabled

  enum is_active: {
    無効: false,
    有効: true
  }

end

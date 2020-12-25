class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts, dependent: :destroy
  has_many :receivers, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :products, through: :carts

  enum is_deleted: { 有効: false, 退会済: true }

  validates :family_name, :first_name, presence: true, length: { maximum: 8 }, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_kana, :first_kana, presence: true, length: { maximum: 10 }, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :address, presence: true, length: { maximum: 80 }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :tel, presence: true, format: { with: /\A\d{10,11}\z/ }


  def active_for_authentication?
    super && (self.is_deleted == "有効")
  end

end

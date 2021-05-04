# ==============================================================================
# app - models - shops
# ==============================================================================
class Shop < ApplicationRecord
  has_many :products
  has_many :coupons
  has_many :game_tickets
  has_one :receipt
  has_secure_password
  has_one_attached :image

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  validates :name, presence: true
  validates :description, presence: true

end

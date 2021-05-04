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
end

# ==============================================================================
# app - models - shops
# ==============================================================================
class Shop < ApplicationRecord
  has_many :products
  has_one :receipt

  has_secure_password
  has_one_attached :image
end

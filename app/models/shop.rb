# ==============================================================================
# app - models - shops
# ==============================================================================
class Shop < ApplicationRecord
  has_one :product
  has_one :receipt

  has_secure_password
  has_one_attached :image
end

# ==============================================================================
# app - models - shops
# ==============================================================================
class Shop < ApplicationRecord
  has_one :product
  has_one :receipt

  has_secure_password
end

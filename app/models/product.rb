# ==============================================================================
# app - models - products
# ==============================================================================
class Product < ApplicationRecord
  belongs_to :shop
  has_many :orders
  has_one :receipt
end

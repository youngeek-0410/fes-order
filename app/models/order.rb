# ==============================================================================
# app - models - orders
# ==============================================================================
class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product
  has_one :receipt
end

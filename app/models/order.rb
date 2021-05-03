# ==============================================================================
# app - models - orders
# ==============================================================================
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :receipt, optional: true
end

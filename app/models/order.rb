# ==============================================================================
# app - models - orders
# ==============================================================================
class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product
  belongs_to :receipt, optional: true
end

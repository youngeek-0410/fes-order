# ==============================================================================
# app - models - orders
# ==============================================================================
class Order < ApplicationRecord
  belongs_to :product
  has_one :receipt

  validates :count, inclusion: {in: 1..10}, presence: true
end

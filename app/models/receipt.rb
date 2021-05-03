# ==============================================================================
# app - models - receipts
# ==============================================================================
class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :product
  belongs_to :coupon, optional: true
  has_many :orders
end

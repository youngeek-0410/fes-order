# ==============================================================================
# app - models - coupon
# ==============================================================================
class Coupon < ApplicationRecord
  belongs_to :user
  has_one :receipt
end

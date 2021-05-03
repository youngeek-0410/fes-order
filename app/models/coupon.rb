# ==============================================================================
# app - models - coupon
# ==============================================================================
class Coupon < ApplicationRecord
  belongs_to :user
  has_one :receipt
  validates :name, presence: true
  validates :discount, presence: true
end

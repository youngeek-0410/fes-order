# ==============================================================================
# app - models - coupon
# ==============================================================================
class Coupon < ApplicationRecord
  belongs_to :user
  has_one :receipt
  validates :user_id, presence: true
  validates :name, presence: true
  validates :discount, presence: true
  validates :is_used, presence: true
end

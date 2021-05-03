# ==============================================================================
# app - models - receipts
# ==============================================================================
class Receipt < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop
  belongs_to :product
  belongs_to :coupon, optional: true
  has_one :order

  def to_used
    self.to_used = true
    self.save!
  end
end

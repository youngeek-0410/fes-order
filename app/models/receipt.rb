# ==============================================================================
# app - models - receipts
# ==============================================================================
class Receipt < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order
  belongs_to :shop
  belongs_to :product
  belongs_to :coupon, optional: true

  validates :price, presence: true
  validates :price_tax, presence: true
  validates :is_used, presence: true
  validates :charge_id, presence: true

  def to_used
    self.to_used = true
    self.save!
  end
end

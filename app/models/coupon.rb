# ==============================================================================
# app - models - coupon
# ==============================================================================
class Coupon < ApplicationRecord
  belongs_to :user
  has_one :receipt
  validates :name, presence: true
  validates :discount, presence: true

  def to_used
    self.is_used = true
    self.save!
  end
end

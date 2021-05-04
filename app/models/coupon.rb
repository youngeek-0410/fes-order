# ==============================================================================
# app - models - coupon
# ==============================================================================
class Coupon < ApplicationRecord
  belongs_to :user
  has_one :receipt
  belongs_to :shop
  validates :name, presence: true
  validates :discount, presence: true

  def to_used
    self.is_used = true
    self.save!
  end

  scope :ramdom1, -> (except_shop) { self.select("shop_id").where.not("shop_id == :except_shop", {except_shop: except_shop}).order("RANDOM()").first() }
end

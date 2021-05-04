# ==============================================================================
# app - models - coupon
# ==============================================================================
class Coupon < ApplicationRecord
  belongs_to :user, optional: true
  has_one :receipt
  belongs_to :shop
  validates :name, presence: true
  validates :discount, presence: true

  def to_used
    self.is_used = true
    self.save!
  end

  scope :ramdom1, -> (unexpect_shop_id) { 
    shop = self.select("shop_id").where.not(shop_id: unexpect_shop_id).order("RANDOM()").first() 
    shop.nil? ? self.find(unexpect_shop_id) : shop
  }
end

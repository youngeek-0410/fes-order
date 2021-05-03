# ==============================================================================
# app - controller - coupons
# ==============================================================================
class CouponsController < ApplicationController
  def index
    @pagy, @coupons = pagy Coupon.where(user_id: current_user.id, is_used: false)
  end

  def create
    coupon = Coupon.new(coupon_params)
    coupon.save!
  end

  private

  def coupon_params
    params.require(:coupon).permit(:name, :discount, :user)
  end
end

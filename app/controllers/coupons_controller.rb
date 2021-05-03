# ==============================================================================
# app - controller - sessions
# ==============================================================================
class CouponsController < ApplicationController
  def index
    @coupons = Coupon.where(user_id: current_user.id,is_used: false)
  end

  def create
  end

  def to_used
  end
end

# ==============================================================================
# app - controller - sessions
# ==============================================================================
class CouponsController < ApplicationController
  def index
    @coupon = Coupon.where(user_id: params[:user_id], is_used: false)
  end

  def show
    @coupon = Coupon.where(id: params[:id])
  end

  def create
  end

  def to_used
  end
end

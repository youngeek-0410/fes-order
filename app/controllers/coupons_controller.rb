# ==============================================================================
# app - controller - coupons
# ==============================================================================
class CouponsController < ApplicationController
  def index
    @pagy, @coupons = pagy Coupon.where(user_id: current_user.id, is_used: false)
  end

  def create
    coupon = Coupon.new(name: coupon_params[:name], discount: coupon_params[:discount].to_i, user_id: coupon_params[:user_id], expired_at: Time.current.end_of_day)
    coupon.save!
    GameTicket.all.first.destroy!
    redirect_to user_coupons_path(current_user)
  end

  private

  def coupon_params
    params.require(:coupon).permit(:name, :discount, :user_id)
  end
end

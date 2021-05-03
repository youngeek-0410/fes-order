# ==============================================================================
# app - controller - coupons
# ==============================================================================
class CouponsController < ApplicationController
  def index
    @pagy, @coupons = pagy Coupon.where(user: current_user, is_used: false)
  end

  def create
    coupon = Coupon.new(name: params[:coupon][:name], discount: params[:coupon][:discount].to_i, user: current_user, expired_at: Time.current.end_of_day)
    coupon.save!
    GameTicket.all.first.destroy!
    redirect_to user_coupons_path(current_user)
  end
end

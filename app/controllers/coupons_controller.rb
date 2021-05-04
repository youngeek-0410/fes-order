# ==============================================================================
# app - controller - coupons
# ==============================================================================
class CouponsController < ApplicationController
  skip_forgery_protection
  def index
    @pagy, @coupons = pagy Coupon.includes(:shop).where(user: current_user, is_used: false)
  end

  def create
    shop = Shop.ramdom1(params[:shop_id])
    name = "#{shop.name} #{params[:discount]}円引きクーポン"
    coupon = Coupon.new(name: name, discount: params[:discount].to_i, user: current_user, expired_at: Time.current.end_of_day, shop: shop)
    coupon.save!
    GameTicket.all.first.destroy!
    render json: { message: 'created' }
  end
end

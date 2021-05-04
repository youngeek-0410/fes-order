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
    discount = params[:discount] == 0 ? 10 : params[:discount]
    name = "#{shop.name} #{discount}円引きクーポン"
    coupon = Coupon.new(name: name, discount: discount, user: current_user, expired_at: Time.current.end_of_day, shop: shop)
    coupon.save!
    GameTicket.where(user: current_user).first.destroy!
    flash[:info] = "#{coupon.name}を獲得しました"
    render json: { message: 'created' }
  end
end

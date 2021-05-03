# ==============================================================================
# app - controller - products
# ==============================================================================

class ProductsController < ApplicationController
  def show
    if current_user.card.nil?
      flash[:warning] = 'クレジットカードが登録されていません。'
      redirect_to edit_user_path(current_user)
    else
      @products = Product.where(shop_id: params[:shop_id])
      @coupons = Coupon.where(user_id: current_user.id)
      @user = current_user
    end
  end
end
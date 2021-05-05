# ==============================================================================
# app - controller - products
# ==============================================================================

class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @coupons = Coupon.where(user_id: current_user.id, shop_id: @product.shop_id, is_used: false)
  end
end

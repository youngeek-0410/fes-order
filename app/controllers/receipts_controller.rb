# ==============================================================================
# app - controller - receipts
# ==============================================================================
class ReceiptsController < ApplicationController
  def index
    @pagy, @receipts = pagy Receipt.includes([:product, :shop, :coupon]).where(user: current_user, is_used: false)
  end

  def show
    @receipt = Receipt.where(user: current_user).find(params[:id])
  end

  def create
    order = Order.create!(product_id: params[:product_id], count: params[:count])
    price_tax = order.product.price * order.count
    price_tax = order.product.price_tax * order.count

    charge = payjp_charge(price_tax, current_user.customer_id)

    params = {
      user: current_user,
      order: order.id,
      shop_id: params[:shop_id],
      product_id: params[:product_id],
      coupon_id: params[:coupon_id],
      price: price,
      price_tax: price_tax,
      charge_id: charge.id,
    }

    receipt = Receipt.create!(params)
    redirect_to user_receipt_path(current_user, receipt)
  end

  def to_used
    receipt = Receipt.where(user: current_user).find(params[:id])
    receipt.to_used
    flash.now[:info] = "#{receipt.product.name}を受け取りました。"
    redirect_to user_receipts_path
  end
end

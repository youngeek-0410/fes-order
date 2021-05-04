# ==============================================================================
# app - controller - receipts
# ==============================================================================
class ReceiptsController < ApplicationController
  def index
    @pagy, @receipts = pagy Receipt.includes([:product, :shop, :coupon]).where(user: User.find(session[:user_id]), is_used: false)
  end

  def show
    @receipt = Receipt.where(user: User.find(session[:user_id])).find(params[:id])
  end

  def create
    order = Order.create!(product_id: params[:product_id], count: params[:count])
    price = order.product.price * order.count
    price_tax = order.product.price_tax * order.count

    charge = payjp_charge(price_tax, User.find(session[:user_id]).customer_id)

    receipts_params = {
      user_id: session[:user_id],
      order: order,
      shop_id: params[:shop_id].to_i,
      product_id: params[:product_id].to_i,
      coupon_id: params[:coupon_id].to_i,
      price: price,
      price_tax: price_tax,
      charge_id: charge.id,
    }

    receipt = Receipt.create!(receipts_params)
    GameTicket.create!(user: User.find(session[:user_id]), expired_at: Time.current.end_of_day, shop_id: receipt.shop_id)
    redirect_to user_receipt_path(receipt)
  end

  def to_used
    receipt = Receipt.where(user_id: session[:user_id]).find(params[:id])
    receipt.to_used
    flash.now[:info] = "#{receipt.product.name}を受け取りました。"
    redirect_to user_receipts_path
  end
end

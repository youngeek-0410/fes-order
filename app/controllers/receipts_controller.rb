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
    coupon = params[:coupon_id].blank? ? nil : params[:coupon_id].to_i
    shop_id = params[:shop_id]
    product_id = [:product_id]

    previous = shop_product_path(shop_id, product_id)

    unless order = Order.create!(product_id: product_id, count: params[:count])
      render: previous
    end

    price = order.product.price * order.count
    price_tax = order.product.price_tax * order.count

    charge = payjp_charge(price_tax, current_user.customer_id)


    receipts_params = {
      user_id: current_user.id,
      order: order,
      shop_id: shop_id.to_i,
      product_id: product_id.to_i,
      coupon_id: coupon,
      price: price,
      price_tax: price_tax,
      charge_id: charge.id,
    }

    unless receipt = Receipt.create!(receipts_params)
      render: previous

    if GameTicket.create!(user: current_user, expired_at: Time.current.end_of_day, shop_id: receipt.shop_id, product_id: receipt.product_id)
      redirect_to user_receipts_path
    else
      render: previous
    end
  end

  def to_used
    receipt = Receipt.where(user: current_user).find(params[:id])
    receipt.to_used
    flash.now[:info] = "#{receipt.product.name}を受け取りました。"
    redirect_to user_receipts_path
  end
end

# ==============================================================================
# app - controller - receipts
# ==============================================================================
class ReceiptsController < ApplicationController
  def index
    @current = params[:current] ? params[:current] : 'not_used'
    @pagy, @receipts = pagy Receipt.includes([:product, :shop, :coupon]).where(user: current_user, is_used: @current == 'used')
  end

  def show
    @receipt = Receipt.where(user: current_user).find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(product: @product, count: params[:count])
    unless @order.save
      @coupons = Coupon.where(user: current_user, is_used: false)
      return render 'products/show', group: @order
    end
    price = @order.product.price * @order.count
    price_tax = @order.product.price_tax * @order.count

    charge = payjp_charge(price_tax, current_user.customer_id)

    coupon = params[:coupon_id].blank? ? nil : Coupon.find(params[:coupon_id].to_i)

    receipts_params = {
      user_id: current_user.id,
      order: @order,
      shop_id: params[:shop_id].to_i,
      product_id: params[:product_id].to_i,
      coupon: coupon,
      price: price,
      price_tax: price_tax,
      charge_id: charge.id,
    }

    coupon&.to_used
    receipt = Receipt.create!(receipts_params)
    GameTicket.create!(user: current_user, expired_at: Time.current.end_of_day, shop_id: receipt.shop_id, product_id: receipt.product_id)
    redirect_to user_receipts_path
  end

  def to_used
    receipt = Receipt.where(user: current_user).find(params[:id])
    if receipt.is_availabled 
      receipt.to_used
      flash.now[:info] = "#{receipt.product.name}を受け取りました。"
      redirect_to user_receipts_path
    else
      flash.now[:info] = "まだ受け取れません。"
      redirect_to user_receipts_path
    end
  end
end

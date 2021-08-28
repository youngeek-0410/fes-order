# ==============================================================================
# app - controller - receipts
# ==============================================================================
class ReceiptsController < ApplicationController
  def index
    @current = params[:current] || 'not_used'
    @pagy, @receipts = pagy Receipt.includes([:product, :shop, :coupon]).where(user: current_user, is_used: @current == 'used')
  end

  def show
    @receipt = Receipt.where(user: current_user).find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])
    order = Order.new(product: @product, count: params[:count])
    unless order.save
      @coupons = Coupon.where(user: current_user, is_used: false)
      flash[:error] = '購入に失敗しました。'
      return render 'products/show'
    end
    coupon = params[:coupon_id].blank? ? nil : Coupon.find(params[:coupon_id].to_i)

    price = order.product.price * order.count
    price_tax = order.product.price_tax * order.count
    price_tax -= coupon.discount unless coupon.nil?

    begin
      charge = payjp_charge(price_tax, current_user.customer_id)
    rescue Payjp::PayjpError => e
      Bugsnag.notify(e)
      flash[:error] = '購入に失敗しました。サーバがダウンしている可能性があります。しばらくしてからお試しください。'
      redirect_to show_product
    rescue => e
      Bugsnag.notify(e)
      flash[:error] = '購入に失敗しました。サーバがダウンしている可能性があります。'
      redirect_to show_product
    end

    receipts_params = {
      user_id: current_user.id,
      order: order,
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
    flash[:info] = "#{receipt.product.name}を購入しました。クイズに挑戦できます！"
    redirect_to user_receipts_path
  end

  def to_used
    receipt = Receipt.where(user: current_user).find(params[:id])
    if receipt.is_availabled
      receipt.to_used
      flash[:info] = "#{receipt.product.name}を受け取りました。"
    else
      flash[:error] = 'まだ受け取れません。'
    end
    redirect_to user_receipts_path
  end
end

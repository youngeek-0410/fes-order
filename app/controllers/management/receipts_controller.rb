# ==============================================================================
# app - controller - management - receipts
# ==============================================================================
class Management::ReceiptsController < Management::ApplicationController
  before_action :set_receipt, only: [:show, :to_availabled]

  def index
    @current = params[:current] ? params[:current] : 'not_availabled'
    @receipts = Receipt.where(shop: current_shop, is_availabled: @current == 'availabled')
  end

  def show
  end
  
  def to_availabled
    @receipt.to_availabled
    flash[:info] = "#{@receipt.product.name}が受け取り可能になりました。"
    redirect_to management_shop_receipts_path
  end

  private

  def set_receipt
    @receipt = Receipt.where(shop: current_shop).find(params[:id])
  end
end

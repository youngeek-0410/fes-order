# ==============================================================================
# app - controller - management - receipts
# ==============================================================================
class Management::ReceiptsController < Management::ApplicationController
  def index
    @current = params[:current] ? params[:current] : 'not_availabled'
    @receipts = Receipt.where(shop: current_shop, is_availabled: @current == 'availabled')
  end

  def to_availabled
    receipt = Receipt.find(params[:id])
    receipt.to_availabled
    flash[:info] = "#{receipt.product.name}が受け取り可能になりました。"
    redirect_to management_shop_receipts_path
  end
end

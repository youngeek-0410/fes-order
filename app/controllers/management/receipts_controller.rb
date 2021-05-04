# ==============================================================================
# app - controller - management - receipts
# ==============================================================================
class Management::ReceiptsController < Management::ApplicationController
  def index
    @receipt = Receipt.where(shop: current_shop, is_used: false)
  end

  def show
    @receipt = Receipt.where(shop: current_shop).find(param[:id])
  end
  
  def to_availabled
    receipt = Receipt.where(shop: current_shop).find(params[:id])
    receipt.to_availabled
    flash.now[:info] = "#{receipt.product.name}が受け取り可能になりました。"
    redirect_to shop_receipts_path
  end
end
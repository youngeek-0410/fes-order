# ==============================================================================
# app - controller - receipts
# ==============================================================================
class ReceiptsController < ApplicationController
  def index
    @pagy, @receipts = pagy Receipt.where(user: current_user, is_used: false)
  end

  def show
    @receipt = Receipt.where(user: current_user).find(params[:id])
  end

  def create
  end

  def to_used
    receipt = Receipt.where(user: current_user).find(params[:id])
    receipt.to_used
    flash.now[:info] = "#{receipt.product.name}を受け取りました。"
    redirect_to user_receipts_path
  end
end

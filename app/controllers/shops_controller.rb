# ==============================================================================
# app - controllers - shops
# ==============================================================================
class ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @shops = @shops.where("name LIKE ?", "%#{params[:q]}%") if params[:q]
    @pagy, @shops = pagy @shops
  end

  def show
    @shop = Shop.find(params[:id])
  end
end


# ==============================================================================
# app - controllers - shops
# ==============================================================================
class ShopsController < ApplicationController
  def index
    @pagy, @shops = pagy Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end
end


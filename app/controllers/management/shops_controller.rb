# ==============================================================================
# app - controller - management - shops
# ==============================================================================
class Management::ShopsController < Management::ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate!, only: [:new, :create]

  def show
  end

  def new
    @shop =Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to management_root_path
    else
      render 'new'
    end
  end

  def update
    if @shop.update_attributes(shop_params)
      flash[:success] = 'ショップ情報を更新しました。'
      redirect_to management_shop_path
    else
      flash[:error] = 'ショップ情報の更新に失敗しました。'
      render 'edit'
    end
  end

  def destroy
    @shop.destroy
    redirect_to management_root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:email, :name, :description, :image, :password, :password_confirmation)
  end

  def set_shop
    @shop = current_shop
  end
end

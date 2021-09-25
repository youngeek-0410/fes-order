# ==============================================================================
# app - controller - system_admin - products
# ==============================================================================
class SystemAdmin::ShopsController < SystemAdmin::ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_param)
    if @shop.save
      flash[:success] = '店情報を登録しました'
      redirect_to system_admin_root_path
    else
      flash[:error] = '店情報の追加に失敗しました'
      render 'new'
    end
  end

  def destroy
    begin
      flash[:success] = '店情報を削除しました'
      @shop.destroy!
      redirect_to system_admin_root_path
    rescue => e
      Bugsnag.notify(e)
      flash[:error] = '店情報削除に失敗しました。もう一度実行してください。'
      redirect_to system_admin_root_path
    end
  end

  private

  def shop_param
    params.require(:shop).permit(:email, :password, :password_confirmation, :name, :description, :image)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end

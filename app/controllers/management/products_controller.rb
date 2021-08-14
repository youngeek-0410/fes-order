# ==============================================================================
# app - controller - management - products
# ==============================================================================
class Management::ProductsController < Management::ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_shop.products.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_shop.products.new(product_params)
    if @product.save
      flash[:success] = '商品情報を登録しました'
      redirect_to management_products_path
    else
      flash[:error] = '商品情報の追加に失敗しました'
      render :new
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = '商品情報を更新しました'
      redirect_to management_product_path
    else
      flash[:error] = '商品情報の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    flash[:success] = '商品情報を削除しました'
    @product.destroy!
    redirect_to management_products_path
    rescue
      flash[:error] = '商品情報の削除に失敗しました'
      redirect_to management_products_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :required_minutes, :image).merge(price_tax: (params[:price].to_i * 1.1).to_i)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end

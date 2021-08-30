# ==============================================================================
# app - controller - system_admin - products
# ==============================================================================
class SystemAdmin::ShopsController < SystemAdmin::ApplicationController
  def index
    @shops = Shop.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

end

# ==============================================================================
# app - controller - management - sessions
# ==============================================================================
class Management::SessionsController < Management::ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]

  layout 'management/sign_in'

  def new
  end

  def create
    @shop = Shop.find_by(email: params[:email])
    if @shop && @shop.authenticate(params[:password])
      sign_in @shop
      redirect_to management_root_path
    else
      @email = params[:email]
      flash.now[:danger] = 'パスワードまたはメールアドレスが間違っています。'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to management_new_session_path
  end
end

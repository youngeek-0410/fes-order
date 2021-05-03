# ==============================================================================
# app - controller - sessions
# ==============================================================================
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in @user
      redirect_to root_path
    else
      @email = params[:email]
      flash.now[:danger] = 'パスワードまたはメールアドレスが間違っています。'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end

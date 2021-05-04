# ==============================================================================
# app - controller - sessions
# ==============================================================================
class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]
  def new
    return redirect_to root_path if authenticated?
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in @user
      flash[:info] = 'ログインしました。'
      redirect_to root_path
    else
      @email = params[:email]
      flash[:error] = 'パスワードまたはメールアドレスが間違っています。'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:info] = 'ログアウトしました。'
    redirect_to new_session_path 
  end
end

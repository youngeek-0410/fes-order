# ==============================================================================
# app - controller - system_admin - sessions
# ==============================================================================
class SystemAdmin::SessionsController < SystemAdmin::ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]

  layout 'management/sign_in'

  def new
  end

  def create
    @system_admin = SystemAdmin.find_by(email: params[:email])
    if @system_admin&.authenticate(params[:password])
      sign_in @system_admin
      redirect_to system_admin_root_path
    else
      @email = params[:email]
      flash.now[:danger] = 'パスワードまたはメールアドレスが間違っています。'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to system_admin_new_session_path
  end
end

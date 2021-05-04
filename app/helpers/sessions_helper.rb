# ==============================================================================
# app - helpers - sessions
# ==============================================================================
module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def authenticated?
    session[:user_id].present?
  end

  def sign_out
    session[:user_id] = nil
  end
end

# ==============================================================================
# app - helpers - system_admin - sessions
# ==============================================================================
module SystemAdmin::SessionsHelper
  def sign_in(system_admin)
    session[:system_admin] = system_admin.id
  end

  def authenticated?
    session[:system_admin].present?
  end

  def sign_out
    session[:system_admin] = nil
  end
end

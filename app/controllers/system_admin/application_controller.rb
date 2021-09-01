# ==============================================================================
# app - controller - system_admin - application
# ==============================================================================
class SystemAdmin::ApplicationController < ActionController::Base
  include SystemAdmin::SessionsHelper
  include Pagy::Backend

  before_action :authenticate!
  protect_from_forgery with: :exception

  layout 'system_admin/application'

  def authenticate!
    redirect_to system_admin_new_session_path unless authenticated?
  end
end

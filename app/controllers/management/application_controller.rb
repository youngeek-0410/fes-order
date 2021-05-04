# ==============================================================================
# app - controller - management - application
# ==============================================================================
class Management::ApplicationController < ActionController::Base
  include Management::SessionsHelper
  include Pagy::Backend

  before_action :authenticate!
  protect_from_forgery with: :exception

  layout 'management/application'

  def authenticate!
    redirect_to management_new_session_path unless authenticated?
  end
end

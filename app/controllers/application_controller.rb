# ==============================================================================
# app - controller - application
# ==============================================================================
class ApplicationController < ActionController::Base
    include SessionsHelper
    include PayjpHelper
    include Pagy::Backend

    protect_from_forgery with: :exception
    layout 'application'

    before_action :authenticate!

    def authenticate!
      redirect_to new_session_path unless authenticated?
    end
  end

# ==============================================================================
# app - controller - application
# ==============================================================================
class ApplicationController < ActionController::Base
    layout 'application'
    protect_from_forgery with: :exception
    include SessionsHelper

    before_action :authenticate!

    def authenticate!
      redirect_to new_session_path unless authenticated?
    end
end

# ==============================================================================
# app - controller - system_admin - application
# ==============================================================================
class SystemAdmin::ApplicationController < ActionController::Base
  include Pagy::Backend

  layout 'system_admin/application'

end

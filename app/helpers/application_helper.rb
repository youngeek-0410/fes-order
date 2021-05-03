# ==============================================================================
# app - helpers - applications
# ==============================================================================
module ApplicationHelper
  include Pagy::Frontend
  def slice20(text)
    if text.length > 20
      "#{text.slice(0, 20)}..."
    else
      text
    end
  end
end

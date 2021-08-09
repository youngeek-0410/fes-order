# ==============================================================================
# app - helpers - management - sessions
# ==============================================================================
module Management::SessionsHelper
  def sign_in(shop)
    session[:shop_id] = shop.id
  end

  def current_shop
    @current_shop ||= Shop.find_by(id: session[:shop_id]) if session[:shop_id]
  end

  def authenticated?
    current_shop.present? && session[:shop_id].present?
  end

  def sign_out
    session[:shop_id] = nil
  end
end

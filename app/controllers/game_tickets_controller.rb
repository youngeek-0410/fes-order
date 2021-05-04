# ==============================================================================
# app - controller - game tickets
# ==============================================================================
class GameTicketsController < ApplicationController
  def index
    @pagy, @game_tickets = pagy GameTicket.where(user: User.find(session[:user_id]), is_used: false)
  end

  def show
    @game_ticket = GameTicket.where(user_id: session[:user_id]).find(params[:id])
  end
end

# ==============================================================================
# app - controller - game tickets
# ==============================================================================
class GameTicketsController < ApplicationController
  def index
    @game_tickets = GameTicket.where(user: current_user, is_used: false)
  end

  def show
    @game_ticket = GameTicket.where(user_id: current_user.id).find(params[:id])
  end
end

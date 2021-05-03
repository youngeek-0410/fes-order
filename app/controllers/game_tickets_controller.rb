# ==============================================================================
# app - controller - game tickets
# ==============================================================================
class GameTicketsController < ApplicationController
  def index
    @pagy, @game_tickets = pagy GameTicket.where(user_id: current_user.id, is_used: false)
  end

  def show
    @game_ticket = GameTicket.where(user_id: current_user.id).find(params[:id])
  end

  def create
    game_ticket = Coupon.new(game_ticket_params)
    game_ticket.save!
  end

  private

  def game_ticket_params
    params.require(:game_ticket).permit(:user)
  end
end

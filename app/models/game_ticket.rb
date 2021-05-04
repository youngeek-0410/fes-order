# ==============================================================================
# app - models - game tickets
# ==============================================================================
class GameTicket < ApplicationRecord
  belongs_to :user
  belongs_to :shop
end

# ==============================================================================
# app - models - game tickets
# ==============================================================================
class GameTicket < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :product

  validates :expired_at, presence: true
end

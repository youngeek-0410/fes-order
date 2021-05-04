# ==============================================================================
# app - models - game tickets
# ==============================================================================
class GameTicket < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :product

  validates :is_used, presence: true
  validates :expired_at, presence: true
end

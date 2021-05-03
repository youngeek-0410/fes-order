# ==============================================================================
# app - models - users
# ==============================================================================
class User < ApplicationRecord
  has_many :receipt
  has_many :order
  has_many :game_ticket
  has_many :coupon

  has_secure_password
end

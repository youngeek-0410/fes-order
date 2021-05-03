# ==============================================================================
# app - models - users
# ==============================================================================
class User < ApplicationRecord
  has_many :receipt
  has_many :order
  has_many :game_ticket, dependent: :destroy
  has_many :coupon, dependent: :destroy
  has_secure_password
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
end

# ==============================================================================
# app - models - users
# ==============================================================================
class User < ApplicationRecord
  has_many :receipt
  has_many :order
  has_many :game_ticket
  has_many :coupon

  before_save{
    self.email = email.downcase
}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: VALID_EMAIL_REGEX
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
end

# ==============================================================================
# app - models - users
# ==============================================================================
class User < ApplicationRecord
  has_many :receipts
  has_many :game_tickets, dependent: :destroy
  has_many :coupons
  has_secure_password

  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  def customer
    Payjp::Customer.retrieve(self.customer_id)
  end

  def card
    customer = self.customer
    customer.default_card.nil? ? nil : customer.cards.retrieve(customer.default_card)
  end
end

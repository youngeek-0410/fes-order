# ==============================================================================
# app - models - products
# ==============================================================================
class Product < ApplicationRecord
  belongs_to :shop
  has_many :orders
  has_many :game_tickets
  has_many :receipts
end

# ==============================================================================
# app - models - products
# ==============================================================================
class Product < ApplicationRecord
  belongs_to :shop
  has_many :orders
  has_many :game_tickets
  has_many :receipts
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :price_tax, presence: true

end

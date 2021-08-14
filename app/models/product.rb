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
  validates :price, presence: true, numericality: { only_integer: true }
  validates :price_tax, presence: true, numericality: { only_integer: true }
  validates :required_minutes, numericality: { only_integer: true }

  before_create :default_image

  def default_image
    unless self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app/assets/images/product_default.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end
end

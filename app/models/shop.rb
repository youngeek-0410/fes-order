# ==============================================================================
# app - models - shops
# ==============================================================================
class Shop < ApplicationRecord
  has_many :products
  has_many :coupons
  has_many :game_tickets
  has_one :receipt
  has_secure_password
  has_one_attached :image

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  validates :name, presence: true
  validates :description, presence: true
  # validate :shop_image_size

  scope :ramdom1, lambda { |unexpect_shop_id|
    shop = self.where.not(id: unexpect_shop_id).order('RANDOM()').first
    shop.nil? ? self.find(unexpect_shop_id) : shop
  }


  # TODO: いつか直す
  # def shop_image_size
  #   if image.blob.byte_size > 1.megabytes
  #     errors.add(:image, 'should be less than 1MB')
  #     # TODO: エラーメッセージを表示するようにhtml修正
  #   end
  # end
end

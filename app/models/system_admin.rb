# ==============================================================================
# app - models - system admins
# ==============================================================================
class SystemAdmin < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

end

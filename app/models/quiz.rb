# ==============================================================================
# app - models - quizs
# ==============================================================================
class Quiz < ApplicationRecord
  scope :ramdom, ->(n) { self.all.sample(n) }

  validates :discription, presence: true
  validates :answer, presence: true
  validates :content1, presence: true
end

# ==============================================================================
# app - models - quizs
# ==============================================================================
class Quiz < ApplicationRecord
  scope :ramdom, lambda { |n|
    self.all.sample(n)
  }

  validates :description, presence: true
  validates :answer, presence: true
  validates :content1, presence: true
  validates :content2, presence: true
  validates :content3, presence: true
end

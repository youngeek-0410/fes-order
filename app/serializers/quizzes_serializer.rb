# ==============================================================================
# app - serializer - quizzes
# ==============================================================================
class QuizzesSerializer
  include JSONAPI::Serializer

  attribute :description
  attribute :answer
  attribute :content1
  attribute :content2
  attribute :content3
end

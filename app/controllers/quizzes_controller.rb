# ==============================================================================
# app - controller - quizzes
# ==============================================================================
class QuizzesController < ApplicationController
  skip_before_action :authenticate!, only: :index

  def index
    count = params[:count].nil? ? 1 : params[:count].to_i
    @quizzes = Quiz.ramdom(count)
    render json: @quizzes
  end
end
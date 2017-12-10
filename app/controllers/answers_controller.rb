class AnswersController < ApplicationController

  def index
    set_question
    @answers = json_response(@question.answers)
  end

  def create
    set_question
    @question.answers.create!(answer_params)
    json_response(@question, :created)
  end

  def show
    json_response(@answer)
  end

  private
  
  def answer_params
    params.permit(:body)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end

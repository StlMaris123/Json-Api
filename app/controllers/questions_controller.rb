class QuestionsController < ApplicationController

  def index
    @questions = json_response(Question.where(private: false ))
  end
  
  def show
    question = Question.find(params[:id])
    json_response(question)
  end

  def create
    set_user
    @user.questions.create!(question_params)
    json_response(@question, :created)
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def question_params
    params.permit(:title, :private)
  end
end

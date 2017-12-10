class UsersController < ApplicationController

  def index
    @users = User.all
    # json_response(@users)
  end

  def create
    @user = User.create!(user_params)
    json_resonse(@user, :created)
  end

  private
  def user_params
    params.permit(:name, :email, :password) 
  end
end

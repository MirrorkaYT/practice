class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else 
      render 'new'
    end
  end

  def myarticles
    
  end
  
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
    end
end

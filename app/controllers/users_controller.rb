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

  def destroy
    session[:user_id]=nil
    @user = User.find(params[:id])
    @user.destroy
    current_user=nil
    redirect_to new_user_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to new_session_path
  end

  def myarticles
  end

  def recover
    if request.post?
      if User.exists?(email: params[:email])
        @user=User.find_by(email: params[:email])
        UserMailer.forgot(@user).deliver_now
      end
      render partial: 'notice'
    end
  end

  def pass_recover
      @user=User.find_by_id(params[:user_id])
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
    end
end

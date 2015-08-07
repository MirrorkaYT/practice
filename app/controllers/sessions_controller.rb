class SessionsController < ApplicationController
  def index
  end

  def new
    if current_user
      redirect_to user_articles_path(current_user.id), notice: 'you are logged in already'
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_articles_path(current_user.id), notice: 'Logged in'
    else
      flash.now.alert = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged out'
  end

  private
    def save_session
    end
end

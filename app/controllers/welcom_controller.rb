class WelcomController < ApplicationController
  def index
    redirect_to new_session_path, notice: "if you don`t have an account, sign up!"
  end
end

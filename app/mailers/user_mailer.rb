class UserMailer < ApplicationMailer
  default from: "activebridge@gmail.com"
  def welcome_mail(user)
    @user=user
    @url  = 'http://localhost:3000/session/new'
    mail(:to => @user.email, :subject => 'Welcome to My Awesome Site')
  end
  def forgot(user)
    @user=user
    mail(:to => @user.email, :subject => 'Password recover')
  end
end

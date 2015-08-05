class UserMailer < ApplicationMailer
  default :from => 'example@blog.com'

  def welcome_mail(user)
    @user=user
    @url  = 'localhost:3000/users/login'
    mail(:to => user.email, :subject => 'Welcome to My Awesome Site')
  end
end

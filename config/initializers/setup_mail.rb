ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "blog.com",
  :user_name            => "blog",
  :password             => "secret",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

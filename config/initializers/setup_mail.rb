ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "development.cne@gmail.com",
  :password             => "venezuela2014",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['leonkay'],
  :password       => ENV['test123'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp
class UserMailer < ActionMailer::Base
  default :from => "ottr@ottr-hero.com"
  
  def welcome_email(email, url)
    @url  = url
    @email= email
    mail(:to => email, :subject => "Welcome to Ottr!")
  end
end

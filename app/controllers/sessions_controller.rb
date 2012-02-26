class SessionsController < ApplicationController
  
  def new
    @title = 'new'
  end
  
  def fblogin
    @app_key = "e046639ad76c13c08ec696376e535062"
    puts "Facebook Login #{params}"
    arguments = FacebookAuthentication::parse_signed_request(params[:signed_request], @app_key)
    puts "Facebook Parameters: #{arguments}"
    
    @user = User.find_by_email(@arguments[:email])
    if @user.nil?
      redirect_to 'signup', :email => arguments[:email], :name => arguments[:name]
    else
      redirect_to root_path
    end
  end
  
  def fblogout
  end

end

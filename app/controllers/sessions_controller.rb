class SessionsController < ApplicationController
  
  def new
    @title = 'new'
  end
  
  def fblogin
    @user = User.find_by_email(params[:email])
    if @user.nil?
      redirect_to 'signup', :email => params[:email], :name => params[:name]
    else
      redirect_to root_path
    end
  end
  
  def fblogout
  end

end

class SessionsController < ApplicationController
  
  def new
    @title = 'new'
  end
  
  def fblogin
    @user = User.find_by_email(params[:email])
    # /user/1
    print "#{@user}"
    @title = @user.name
    render 'new'
  end

end

require 'openssl'
require 'base64'
require 'json'

class UsersController < ApplicationController
  def new
    @user = User.create(:email => args[:email], :name => args[:name])
  end
private
 
end

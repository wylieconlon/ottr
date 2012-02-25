class UsersController < ApplicationController
  def new
    args = base64_url_decode(params[:signed_request])
    @user = User.create(:email => args[:email], :name => args[:name])
  end
private

  def base64_url_decode(str)
   str += '=' * (4 - str.length.modulo(4))
   Base64.decode64(str.tr('-_','+/'))
 end

end

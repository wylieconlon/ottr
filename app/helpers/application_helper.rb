module ApplicationHelper
  def signed_in?
    !current_user.nil?
  end
  
  def is_not_splashpage?
    !(request.path_info == "/" and current_user.nil?)
  end
end

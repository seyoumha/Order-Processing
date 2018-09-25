class ApplicationController < ActionController::Base


  def authenticate
    redirect_to '/login' unless current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  def check_role(role_name)
    current_user.role == role_name.to_s
  end

end

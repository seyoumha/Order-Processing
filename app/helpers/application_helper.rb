module ApplicationHelper
  def current_user_and_role

    user = User.find(session[:user_id]) if session[:user_id]

    if user && user.email
      "#{user.email.split('@').first.humanize} at #{user.role.humanize}"
    end
    
  end
end

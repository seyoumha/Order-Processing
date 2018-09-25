class LoginController < ApplicationController
  def new
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to login_url
  end

  def create
    user = User.where(email: params[:email])[0]
    if user
      session[:user_id] = user.id
      redirect_to user_landing_page(user)
    else
      redirect_to login_url
    end
  end

  private
  def user_landing_page user
    case user.role
    when 'finance'
      '/finance'
    when 'delivery'
      '/shipping'
    else
      '/orders'
    end
  end
end

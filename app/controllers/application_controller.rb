class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    redirect_to root_url if !SessionBag.get_current_user(session)  
  end
end
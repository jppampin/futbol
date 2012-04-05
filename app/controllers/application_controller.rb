class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  
  def require_login
    redirect_to root_url if !SessionBag.get_current_user(session)  
  end
  
  def require_admin
    redirect_to root_url if !SessionBag.get_current_user(session) || !SessionBag.get_current_user(session).admin?  
  end
end
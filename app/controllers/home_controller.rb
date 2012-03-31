class HomeController < ApplicationController
  before_filter :require_login
  skip_before_filter :require_login, :only => [:index, :login, :signup, :about]
    
  def index
    @user = SessionBag.get_current_user(session)
  end
  
  def login
    @user = User.new
  end
  
  def logout
    SessionBag.clean_current_user(session)
    redirect_to root_url
  end
  
  def signup
    @user = User.new
  end
  
  def about
  end
end
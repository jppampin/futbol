class HomeController < ApplicationController

  def new
    @user = User.new
  end
  
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

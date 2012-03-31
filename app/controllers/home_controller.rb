class HomeController < ApplicationController
  before_filter :require_login
  skip_before_filter :require_login, :only => [:index, :login, :signup, :about]
    
  def index
    @user = SessionBag.get_current_user(session)
    
    #user = User.first
    #player = Player.new
    #user.players << player
    #player.user = user
    #match = Match.new
    #match.name = "this is a test"
    #match.players << player
    #match.save
    
    
    
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
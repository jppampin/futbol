class HomeController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :login, :signup, :about]
    
  def index
    @user = SessionBag.get_current_user(session)
    @match = Match.last
    @player = @match.players.find_by_user_id(@user.id) if @user
    @players = Player.find(:all, :conditions => ["match_id = ?", @match.id], :order => "score desc")
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
  
  def add_user_to_match
    match = Match.last
    user = SessionBag.get_current_user(session)

    if !Player.find_by_user_id_and_match_id(user.id, match.id)
      player = Player.new
      player.user = user
      player.score = user.score
      user.players << player
      match.players << player
      match.save
    end
    
    redirect_to root_url
  end
  
  def confirm_player_to_match
    set_player_confirmation(Player.find(params[:player]), true)
  end
  
  def cancel_player_to_match
    set_player_confirmation(Player.find(params[:player]), false)
  end

  def new_match
    @match = Match.new
  end
  
  def edit_match
    @match = Match.find(params[:match])
  end

  def edit_user
    @user = User.find(params[:user])
  end
  
  private
  def set_player_confirmation(player, status)
    player.confirm = status
    player.cancel = !status
    player.save
    
    redirect_to root_url
  end
  
end
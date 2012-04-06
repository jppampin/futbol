module HomeHelper
  def is_user_logged
    !@user.nil?
  end
  
  def is_admin_logged            
    is_user_logged && @user.admin?
  end

  def is_user_registered_and_match_available
     !@match.closed && @user && !@player
  end
end

class SessionBag
  
  def self.get_current_user(session)
    User.find_by_id(session[:current_user])
  end
  
  def self.set_current_user(session, current_user)
    session[:current_user] = current_user.id
  end
  
  def self.clean_current_user(session)
    session[:current_user] = nil
  end
  
  def self.set_error(flash, message)
    flash[:error] = message
  end
  
  def self.get_error(flash)
    flash[:error]
  end
  
end
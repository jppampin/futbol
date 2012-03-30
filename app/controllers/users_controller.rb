class UsersController < ApplicationController
  def create
    user = User.new(params[:user])
    
    if User.find_by_name(user.name)
      SessionBag.set_error(flash, "user already exists")
    else
      if user.save
        SessionBag.set_current_user(session, user)
      else
        SessionBag.set_error(flash, "could not save new user")
      end
    end
    
    redirect_to root_url
  end
  
  def login
    user = User.new(params[:user])
    user = User.find_by_name_and_password(user.name, user.password)
    
    if user
      SessionBag.set_current_user(session, user)
    else
      SessionBag.set_error(flash, "login fail")
    end
    
    redirect_to root_url
  end
  
  def list
    @users = User.all
  end
end
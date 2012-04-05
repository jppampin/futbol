class UsersController < ApplicationController
  before_filter :require_admin
  skip_before_filter :require_login, :only => [:create, :login]
  skip_before_filter :require_admin, :only => [:create, :login, :update]
  
  def create
    user = User.new(params[:user])

    if user.save
      SessionBag.set_current_user(session, user)
    else
      SessionBag.set_error(flash, user.errors.first[1])
    end

    redirect_to root_url
  end
  
  def update
    user = User.find(params[:id])
    
    if !user.update_attributes(params[:user])
      SessionBag.set_error(flash, user.errors.first[1])
    end
  
    redirect_to root_url
  end
  
  def login
    user = User.new(params[:user])
    user = User.find_by_name_and_password(user.name, user.password)
    
    SessionBag.set_current_user(session, user) if user
    SessionBag.set_error(flash, "login fail") if !user

    redirect_to root_url
  end
  
  def list
    @users = User.all
  end
end
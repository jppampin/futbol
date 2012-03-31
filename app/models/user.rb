class User < ActiveRecord::Base
  validates_presence_of :name, :message => "name can't be blank"
  validates_presence_of :password, :message => "password can't be blank"
  validates_confirmation_of :password, :message => "password should match confirmation"
  validates_length_of :name, :minimum => 3, :too_short => "name should have at least 3 characters"
  validates_length_of :password, :minimum => 3, :too_short => "password should have at least 3 characters"
  validates_uniqueness_of :name, :message => "user already exists"
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end

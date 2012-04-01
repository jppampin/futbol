class User < ActiveRecord::Base
  has_many :players
  validates_presence_of :name, :message => "name can't be blank"
  validates_length_of :name, :minimum => 3, :too_short => "name should have at least 3 characters"
  validates_uniqueness_of :name, :message => "user already exists"
  validates_presence_of :email, :message => "email can't be blank"
  validates_length_of :email, :minimum => 6, :too_short => "email address too short"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => "email address is invalid"
  validates_uniqueness_of :email, :message => "email already exists"
  validates_presence_of :password, :message => "password can't be blank"
  validates_confirmation_of :password, :message => "password should match confirmation"
  validates_length_of :password, :minimum => 3, :too_short => "password should have at least 3 characters"
  
  def admin?
    self.name == "admin"
  end
  
  def score
    confirmed = 0.0
    canceled = 0.0
    
    Player.find(:all, :conditions => ["user_id = ?", self.id]).each do |p|
      confirmed +=1.0 if p.confirm
      canceled +=1.0 if p.cancel
      canceled +=2.0 if !p.cancel && !p.confirm 
    end

    if (confirmed + canceled) != 0
      confirmed - canceled / Match.count 
    else 
      0 
    end
  end
end

class User < ActiveRecord::Base
  attr_accessible :user_id, :first_name, :last_name, :email, :last_logon, :last_logon_ip, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :user_id
  validates_uniqueness_of :user_id
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_format_of :user_id, :with => /^\w+$/i
  
  def self.authenticate(user_id, password)
    user = find_by_user_id(user_id)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def change_password(password, repeat)
    self.password = password
    self.password_confirmation = repeat
    save
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  has_many :notes
end


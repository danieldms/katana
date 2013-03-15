class User < ActiveRecord::Base
   	attr_accessible :email, :name, :password, :status, :permission, :name, :password_confirmation;
  
  	attr_accessor :password
  	before_save :encrypt_password
  
  	validates :password, :confirmation => true
  	validates :email, :presence => true , :uniqueness => true
    validates :password, :password_confirmation, :name, :presence => true
    #validates :terms, :presence => true

  	def self.authenticate(email, password)
    	user = find_by_email(email)
    	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      		user
    	else
      		nil
    	end
  	end

   	def encrypt_password
    	if password.present?
      		self.password_salt = BCrypt::Engine.generate_salt
      		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    	end
  	end
end
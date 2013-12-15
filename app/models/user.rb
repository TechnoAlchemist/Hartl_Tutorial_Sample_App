class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates_presence_of :name
	validates_length_of   :name, maximum: 50
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_format_of     :email, with: VALID_EMAIL_REGEX
	validates_uniqueness_of :email, case_sensitive: false 

	validates_length_of :password, minimum: 6
	has_secure_password
	

end

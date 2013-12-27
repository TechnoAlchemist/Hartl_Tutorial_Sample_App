class User < ActiveRecord::Base
	before_save { email.downcase! }
	before_create :create_remember_token

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	
	validates_presence_of 	:name
	validates_length_of   	:name, maximum: 50
	validates_format_of     :email, with: VALID_EMAIL_REGEX
	validates_uniqueness_of :email, case_sensitive: false 
	validates_length_of 	:password, minimum: 6
	
	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end

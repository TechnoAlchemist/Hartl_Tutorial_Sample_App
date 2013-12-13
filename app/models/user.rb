class User < ActiveRecord::Base
	validates_presence_of :name
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_format_of :email, with: VALID_EMAIL_REGEX
	validates_length_of :name, maximum: 50
end

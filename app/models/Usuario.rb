require 'bcrypt'

class Usuario
	include DataMapper::Resource

	property :email, String , :key => true

	property :nombre, String
	property :password, String
	property :fecha, Date
	property :peso, Integer

  	def self.authenticate(email, password)
    	user = Usuario.find_by_email(email)
    	return nil if user.nil?
    	user.has_password?(password)? user : nil
  	end

  	def has_password?(password)
    	::BCrypt::Password.new(crypted_password) == password
  	end

  	def is_the_same_password?(an_password)
		::BCrypt::Password.new(crypted_password) == an_password
	end
end

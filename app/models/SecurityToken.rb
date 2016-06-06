require 'dm-serializer'

class SecurityToken 

	attr_accessor :emailUsuario
	attr_accessor :nombreUsuario
	attr_accessor :authToken

	def initialize(emailUsuario,nombreUsuario,authToken)
		@nombreUsuario = nombreUsuario
		@emailUsuario = emailUsuario
		@authToken = authToken
	end

  	def self.json_create(o)
    	SecurityToken.new(o["emailUsuario"],o["nombreUsuario"],o["authToken"])
  	end
end

require "json"

class SecurityToken 

	attr_accessor :idUsuario
	attr_accessor :nombreUsuario
	attr_accessor :emailUsuario
	attr_accessor :authToken

	def initialize(idUsuario,nombreUsuario,emailUsuario,authToken)
		@idUsuario = idUsuario
		@nombreUsuario = nombreUsuario
		@emailUsuario = emailUsuario
		@authToken = authToken
	end

	def to_json(*a)
	    {
	      "json_class"   => self.class.name,
	      "data"         => {'idUsuario'=>@idUsuario, 'nombreUsuario'=>@nombreUsuario,
	      					 'emailUsuario'=>@emailUsuario, 'authToken'=>@authToken}
	    }.to_json(*a)
  	end

  	def self.json_create(o)
    	SecurityToken.new(o["data"]["idUsuario"],o["data"]["nombreUsuario"],o["data"]["emailUsuario"],o["data"]["authToken"])
  	end
end

FitnessTime::App.helpers do
	
	def handle_request_for_login(email, password)
		begin
			url = "/login?email=" + email + "&pass=" + password
			return Request.get_request(url)
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def handle_request_for_close_session()
		begin
			url = "/close?authToken=" + current_token["authToken"] + "&email=" + current_token["emailUsuario"]
			return Request.get_request(url)
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def response_ok?(response)
		return response.code == '200'
	end
end
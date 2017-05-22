FitnessTime::App.helpers do
	
	

	def handle_request_for_all_routines()
		begin
			url = "/rutinas?authToken=" + current_token["authToken"]
			return Request.get_request(url)
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def handle_request_for_update_user(user)
		begin
			url = "/usuarios?authToken=" + current_token["authToken"]
			return Request.put_request(url + "&usuario=" + (user.to_json.gsub /\s+/, '%20'))
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end


	def handle_request_for_create_user(user)
		begin
			return Request.post_request("/usuarios?usuario=" + (user.to_json.gsub /\s+/, '%20'))
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def handle_request_for_activate_user(emailUser)
		begin
			url = "/activar?email=" + emailUser
			return Request.get_request(url)
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def response_ok?(response)
		return response.code == '200'
	end
end
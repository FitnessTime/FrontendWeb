FitnessTime::App.helpers do
	

	def handle_request_for_all_exercises()
		begin
			url = "/ejercicios?authToken=" + current_token["authToken"]
			return Request.get_request(url)
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def handle_request_for_update_exercise(ejercicio)
		begin
			url = "/ejercicios?authToken=" + current_token["authToken"]
			return Request.put_request(url + "&ejercicio=" + (ejercicio.to_json.gsub /\s+/, '%20'))
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end


	def handle_request_for_create_exercise(ejericioDTO)
		begin
			url = "/ejercicios?authToken=" + current_token["authToken"]
			return Request.post_request(url + "&ejercicio=" + (ejericioDTO.to_json.gsub /\s+/, '%20'))
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def handle_request_for_delete_exercise(idEjercicio, esDeCarga)
		begin
			url = "/ejercicios?authToken=" + current_token["authToken"] + "&id=" + idEjercicio + '&esDeCarga=' + esDeCarga
			return Request.delete_request(url)
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def response_ok?(response)
		return response.code == '200'
	end
end
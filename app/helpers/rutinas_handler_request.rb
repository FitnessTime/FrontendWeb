FitnessTime::App.helpers do
	
	url = "/rutinas?authToken=" + current_token["authToken"]

	def handle_request_for_all_routines()
		return Request.get_request(url + current_token["authToken"])
	end

	def handle_request_for_update_routine(rutina)
		return Request.get_request(url + "&rutina=" + rutina.to_json(''))
	end


	def handle_request_for_create_routine(rutinaDto)
		return Request.post_request(url + "&rutina=" + rutinaDTO.to_json(''))
	end

	def response_ok?(response)
		return response.code == '200'
	end
end
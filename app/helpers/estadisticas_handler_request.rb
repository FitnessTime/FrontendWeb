FitnessTime::App.helpers do
	
	def handle_request_for_all_marcas()
		begin
			url = "/marcas?authToken=" + current_token["authToken"]
			return Request.get_request(url)
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end

	def handle_request_for_all_pasos_por_dia()
		begin
			url = "/pasos?authToken=" + current_token["authToken"]
			return Request.get_request(url)
		rescue Exception
      		raise Exception, 'Error al conectar con el servidor, intente nuevamente.'
    	end
	end
end
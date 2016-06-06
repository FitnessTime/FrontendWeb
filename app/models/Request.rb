class Request

	def self.get_request(path)

		req = Net::HTTP::Get.new(path)
		#req.set_form_data({'pass' => password}) for headers
    	http = Net::HTTP.new(Constantes.host, Constantes.port)
    	http.request(req)
	end

end
FitnessTime::App.helpers do
	
	url = "/rutinas?authToken="

	def handler_request(request)
		return Request.get_request(url + current_token["authToken"])
	end

	def isOk(request)
		return request.code == '200'
	end
end
class Request

	def self.get_request(url)
		url = URI.parse(url)
    	req = Net::HTTP::Get.new(url.path)
    	#req.set_form_data({'pass' => password}) for headers
    	http = Net::HTTP.new(url.host, url.port)
    	http.request(req)
	end

end
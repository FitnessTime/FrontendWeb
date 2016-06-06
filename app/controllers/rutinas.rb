require 'net/http'

FitnessTime::App.controllers :rutinas do
  
  get :all, :map => '/all' do
	response = Request.get_request("/rutinas?authToken=" + current_token["authToken"])
  	if (response.code == "200")
    	@rutinas = JSON.parse(response.body)
    	render 'rutinas/all'   
      else
        @rutinas = Array.new(0)
        flash.now[:error] = response.body
        render 'rutinas/all'
      end
  end

end
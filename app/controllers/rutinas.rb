require 'net/http'
require_relative '../Assemblers/RutinaAssembler.rb'

FitnessTime::App.controllers :rutinas do
  
  get :nuevo, :map => '/nuevo' do
    @rutina = Rutina.new
    render 'rutinas/nuevo'
  end

  post :crear do
      assembler = RutinaAssembler.new
      rutina = Rutina.new(params[:rutina])
      rutinaDTO = assembler.crear_dto(rutina, current_token["emailUsuario"])
      
      response = Request.post_request("/rutinas?authToken=" + current_token["authToken"] + "&rutina=" + rutinaDTO.to_json(''))
      status = response.code
      if status == '200'
         flash.now[:success] = 'Rutina creada con exito'
         redirect 'all'
      else
          @rutina = Rutina.new
          flash.now[:error] = 'Error al crear la rutina'
          render 'rutinas/nuevo'
      end
  end

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
require 'net/http'
require_relative '../Assemblers/RutinaAssembler.rb'

FitnessTime::App.controllers :rutinas do
  
  get :nuevo do
    @rutinaDTO = RutinaDTO.new
    render 'rutinas/nuevo'
  end

  post :crear do
      rutinaDTO = RutinaDTO.new(params[:rutina_dto])
      rutinaDTO.idUsuario = current_token["emailUsuario"]
      response = handle_request_for_create_routine(rutinaDTO)
      if (response_ok?(response))
         flash[:success] = 'Rutina creada con exito'
         redirect '/rutinas/all'
      else
          @rutinaDTO = RutinaDTO.new(params[:rutina_dto])
          flash.now[:error] = 'Error al crear la rutina'
          render 'rutinas/nuevo'
      end
  end

  get :editar, :with => :rutina_id do
    begin
      $rutinas.each do |rutina|
        if(rutina['idWeb'] == params[:rutina_id].to_i)
          @rutinaDTO = RutinaAssembler.from_json(rutina)
        end
      end
      render 'rutinas/editar'
    rescue Exception
      raise Exception, 'no hay rutinas'
    end
  end

  post :editar, :with => :rutina_id do
      $rutinas.each do |rutina|
        if(rutina['idWeb'] == params[:rutina_id].to_i)
          @rutinaDTO = RutinaDTO.new(params[:rutina_dto])
          @rutinaDTO.idUsuario = current_token['emailUsuario']
        end
      end
      response = handle_request_for_update_routine(@rutinaDTO)
      if (response_ok?(response))
        flash.now[:success] = 'Rutina modificada con exito'
        redirect '/rutinas/all'
      else
        flash.now[:error] = 'Error al modificar la rutina'
        render 'rutinas/editar'
      end
  end

  get :all do
	  response = handle_request_for_all_routines()
    if (response_ok?(response))
    	$rutinas = JSON.parse(response.body)
      render 'rutinas/all'
    else
      $rutinas = Array.new(0)
      flash.now[:error] = response.body
      render 'rutinas/all'
    end
  end

end
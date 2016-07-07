require 'net/http'
require_relative '../Assemblers/RutinaAssembler.rb'

FitnessTime::App.controllers :ejercicios do
  
  get :nuevo do
    @rutinaDTO = RutinaDTO.new
    @titulo = "Ejercicio de carga"
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
          flash.now[:danger] = 'Error al crear la rutina'
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
        flash[:success] = 'Rutina modificada con exito'
        redirect '/rutinas/all'
      else
        flash.now[:danger] = 'Error al modificar la rutina'
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
      flash.now[:danger] = response.body
      render 'rutinas/all'
    end
  end

  delete :eliminar do
    response = handle_request_for_delete_routine(params[:id_rutina])
    if (response_ok?(response))
      redirect '/rutinas/all'
    else
      flash.now[:danger] = "No se pudo eliminar la rutina."
      render 'rutinas/all'
    end
  end

end
require 'net/http'
require_relative '../Assemblers/EjercicioAssembler.rb'

FitnessTime::App.controllers :ejercicios do
  
  get :nuevo , :with => :rutina_id do
    @ejercicioDTO = EjercicioDTO.new
    @ejercicioDTO.idRutina = params[:rutina_id]
    $esDeCarga = params[:carga].to_s
    if $esDeCarga == "true"
      @titulo = "Ejercicio de carga"
    else
      @titulo = "Ejercicio aerobico"
    end
    render 'ejercicios/nuevo'
  end

  post :crear do
      @ejercicioDTO = EjercicioDTO.new(params[:ejercicio_dto])
      response = handle_request_for_create_exercise(@ejercicioDTO)
      if (response_ok?(response))
         flash[:success] = 'Ejercicio creado con exito'
      else
          @ejercicioDTO = RutinaDTO.new(params[:rutina_dto])
          flash.now[:danger] = 'Error al crear la rutina'
      end
      render 'ejercicios/nuevo'
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
	  response = handle_request_for_all_exercises()
    if (response_ok?(response))
    	$ejercicios = JSON.parse(response.body)
      render 'ejercicios/all'
    else
      $ejercicios = Array.new(0)
      flash.now[:danger] = response.body
      render 'ejercicios/all'
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
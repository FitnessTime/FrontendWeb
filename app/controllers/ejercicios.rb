require 'net/http'
require 'chartkick'
include Chartkick::Helper
require_relative '../Assemblers/EjercicioAssembler.rb'

FitnessTime::App.controllers :ejercicios do
  
  get :nuevo , :with => :rutina_id do
    @ejercicioDTO = EjercicioDTO.new
    @ejercicioDTO.idRutina = params[:rutina_id]
    $esDeCarga = params[:carga].to_s
    if $esDeCarga == "true"
      @titulo = "Ejercicio de carga"
      @ejercicioDTO.esDeCarga = true
    else
      @titulo = "Ejercicio aerobico"
      @ejercicioDTO.esDeCarga = false
    end
    render 'ejercicios/nuevo'
  end

  post :crear do
      @ejercicioDTO = EjercicioDTO.new(params[:ejercicio_dto])
      @ejercicioDTO.diaDeLaSemana = params[:dias]
      response = handle_request_for_create_exercise(@ejercicioDTO)
      if (response_ok?(response))
         flash.now[:success] = 'Ejercicio creado con exito'
      else
          @ejercicioDTO = EjercicioDTO.new
          @ejercicioDTO.idRutina = params[:rutina_id]
          flash.now[:danger] = 'Error al crear el ejercicio'
      end
      params[:rutina_id] = @ejercicioDTO.idRutina
      render '/ejercicios/nuevo'
  end

  get :editar, :with => :id_ejercicio do
    begin
      $ejercicios.each do |ejercicio|
        if(ejercicio['idWeb'] == params[:id_ejercicio].to_i)
          assembler = EjercicioAssembler.new
          @ejercicioDTO = assembler.from_json(ejercicio)
          $esDeCarga = @ejercicioDTO.esDeCarga
          if $esDeCarga 
            @titulo = "Ejercicio de carga"
          else
            @titulo = "Ejercicio aerobico"
          end
          
        end
      end
      render 'ejercicios/editar'
    rescue Exception
      raise Exception, 'no hay ejercicios'
    end
  end

  post :editar, :with => :id_ejercicio do
      $ejercicios.each do |ejercicio|
        if(ejercicio['idWeb'] == params[:id_ejercicio].to_i)
          @ejercicioDTO = EjercicioDTO.new(params[:ejercicio_dto])
          @ejercicioDTO.diaDeLaSemana = params[:dias]
        end
      end
      response = handle_request_for_update_exercise(@ejercicioDTO)
      if (response_ok?(response))
        flash[:success] = 'Ejercicio modificado con exito'
        redirect '/rutinas/all'
      else
        flash.now[:danger] = 'Error al modificar el ejercicio'
        render 'ejercicios/editar'
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
    response = handle_request_for_delete_exercise(params[:id_ejercicio], params[:carga])
    if (response_ok?(response))
      redirect '/ejercicios/all'
    else
      flash.now[:danger] = "No se pudo eliminar el ejercicio."
      render 'ejercicios/all'
    end
  end

end
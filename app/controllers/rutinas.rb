require 'net/http'
require_relative '../Assemblers/RutinaAssembler.rb'

FitnessTime::App.controllers :rutinas do
  
@rutinas = Array.new

  get :nuevo do
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
         redirect '/rutinas/all'
      else
          @rutina = Rutina.new
          flash.now[:error] = 'Error al crear la rutina'
          render 'rutinas/nuevo'
      end
  end

  get :editar, :with => :rutina_id do
    begin
      assembler = RutinaAssembler.new
      $rutinas.each do |rutina|
        if(rutina['idWeb'] == params[:rutina_id].to_i)
          @rutina = assembler.from_json(rutina)
        end
      end
      render 'rutinas/editar'
    rescue Exception
      raise Exception, 'no hay rutinas'
    end
  end

  post :update, :with => :rutina_id do
    #begin
    assembler = RutinaAssembler.new
      $rutinas.each do |rutina|
        if(rutina['idWeb'] == params[:rutina_id].to_i)
          @rutina = assembler.from_json(JSON.parse(params[:rutina]))
        end
      end
      handler_response()
      response = Request.get_request("/rutinas?authToken=" + current_token["authToken"] + "&rutina=" + @rutina.to_json(''))
      if (response.code == "200")
        handler_error()
        flash.now[:success] = 'Rutina modificada con exito'
        redirect '/rutinas/all'
      else
        flash.now[:error] = 'Error al modificar la rutina'
        render 'rutinas/editar'
      end
    #rescue Exception
    #  raise Exception, 'no hay rutinas'
    #end
  end

  get :all do
	  response = handler_request()
    if (isOk(response))
    	$rutinas = JSON.parse(response.body)
    	render 'rutinas/all'
      render_correct_page() 
      else
        @rutinas = Array.new(0)
        flash.now[:error] = response.body
        render 'rutinas/all'
      end
  end

end
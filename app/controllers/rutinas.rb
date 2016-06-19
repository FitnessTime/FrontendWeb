require 'net/http'
require_relative '../Assemblers/RutinaAssembler.rb'

FitnessTime::App.controllers :rutinas do
  
@rutinas = Array.new

  get :nuevo do
    @rutina = Rutina.new
    render 'rutinas/nuevo'
  end

  post :crear do
    # Esto del assembler y eso habria que analizarlo conceptualmente.
      assembler = RutinaAssembler.new
      rutina = Rutina.new(params[:rutina])
      rutinaDTO = assembler.crear_dto(rutina, current_token["emailUsuario"])
      
      response = handle_request_for_create_routine(rutinaDTO)
      if (response_ok?(response))
         flash.now[:success] = 'Rutina creada con exito'
         redirect '/rutinas/all'
      else
          @rutina = Rutina.new
          flash.now[:error] = 'Error al crear la rutina'
          render 'rutinas/nuevo'
      end
  end

  get :editar, :with => :rutina_id do
    # Esto del assembler y eso habria que analizarlo conceptualmente.
    begin
      assembler = RutinaAssembler.new
      @rutinas.each do |rutina|
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
    # Esto del assembler y eso habria que analizarlo conceptualmente.
    # Por otra parte estaria bueno dejar este comportamiento en un metodo
    # la parte del clojure me refiero
    assembler = RutinaAssembler.new
      @rutinas.each do |rutina|
        if(rutina['idWeb'] == params[:rutina_id].to_i)
          @rutina = assembler.from_json(JSON.parse(params[:rutina]))
        end
      end
      response = handle_request_for_update_routine(@rutina)
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
    	@rutinas = JSON.parse(response.body)
      render 'rutinas/all'
    else
      @rutinas = Array.new(0)
      flash.now[:error] = response.body
      render 'rutinas/all'
    end
  end

end
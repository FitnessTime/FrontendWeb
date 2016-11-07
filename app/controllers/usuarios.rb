FitnessTime::App.controllers :usuarios do
  

  get :activar, :map => '/activar' do
    begin
      handle_request_for_activate_user(params[:email])
      render 'usuarios/activar'
    rescue Exception
      raise Exception, 'Error interno'
    end
  end

  get :nuevo, :map => '/registrar' do
    @usuario = Usuario.new
    render 'usuarios/nuevo'
  end

  get :cambiarContrasenia, :map => '/cambiarContrasenia' do
    @usuario = Usuario.new
    render 'usuarios/cambiarContrasenia'
  end

  post :crear do
      usuario = Usuario.new(params[:usuario])
      response = handle_request_for_create_user(usuario)
      if response_ok?(response)
        flash[:success] = 'Usuario creado'
        redirect '/'
      else
        @usuario = Usuario.new
        flash.now[:error] = 'Es necesario completar los campos'
        render 'usuarios/nuevo'
      end
  end

  get :editar do
    begin
      @usuario = Usuario.new
      @usuario.email = current_token["emailUsuario"]
      @usuario.peso = current_token["pesoUsuario"]
      @usuario.fecha = current_token["fechaNacimientoUsuario"]
      @usuario.nombre = current_token["nombreUsuario"]
      @usuario.cantidadMinimaPasos = current_token["cantidadMinimaPasosUsuario"]
      render 'usuarios/editar'
    rescue Exception
      raise Exception, 'Error interno'
    end
  end

  post :editar do
    usuario = Usuario.new(params[:usuario])
    response = handle_request_for_update_user(usuario)
    if response_ok?(response)
      modify_token JSON.parse(response.body)
      flash[:success] = 'Usuario modificado'
      redirect '/'
    else
      @usuario = Usuario.new
      flash.now[:error] = 'Es necesario completar los campos'
      render 'usuarios/nuevo'
    end
  end

end
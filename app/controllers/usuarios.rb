FitnessTime::App.controllers :usuarios do
  

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
        response = Request.post_request("/usuarios?usuario=" + usuario.to_json)
        status = response.code
        if status == '200'
          flash[:success] = 'Usuario creado'
          redirect '/'
        else
          @usuario = Usuario.new
          flash.now[:error] = 'Es necesario completar los campos'
          render 'usuarios/nuevo'
        end
  end



end
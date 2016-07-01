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
      confirmacion_password = params[:usuario][:confirmacion_password]
      password = params[:usuario][:password]
      usuario = Usuario.new(params[:usuario])
      params[:usuario].reject!{|k,v| k == 'confirmacion_password'}
      if (params[:usuario][:password] == confirmacion_password)
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
      else
        @usuario = Usuario.new (params[:usuario])
        flash.now[:error] = 'Password no coinciden'
        render 'usuarios/nuevo'          
      end
  end



end
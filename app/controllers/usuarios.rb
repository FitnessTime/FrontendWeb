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
      email = params[:usuario][:email]
      password = params[:usuario][:password]
      nombre = params[:usuario][:nombre]
      fecha = params[:usuario][:fechaNacimiento]
      peso = params[:usuario][:peso]
      params[:usuario].reject!{|k,v| k == 'confirmacion_password'}
      if (params[:usuario][:password] == confirmacion_password)
        response = Request.get_request("/registrar?email=" + email + "&pass=" + password + "&nombre=" + nombre + "&fecha=" + fecha + "&peso=" + peso)
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
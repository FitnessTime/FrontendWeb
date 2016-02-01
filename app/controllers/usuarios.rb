FitnessTime::App.controllers :usuarios do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :nuevo, :map => '/registrar' do
    @usuario = Usuario.new
    render 'usuarios/nuevo'
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
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
      params[:usuario].reject!{|k,v| k == 'confirmacion_password'}
      if (params[:usuario][:password] == confirmacion_password)
        @usuario = Usuario.new(params[:usuario])
        if @usuario.save
          flash[:success] = 'Usuario creado'
          redirect '/'
        else
          flash.now[:error] = 'Es necesario completar los campos'
          render 'usuarios/nuevo'
        end
      else
        @usuario = Usuario.new (params[:usuario])
        flash.now[:error] = 'Password no coinciden'
        render 'usuarios/nuevo'          
      end
  end

  get :registrarr, :map => '/registrarr' do 

  end

  post :registrarr, :map => '/registrarr' do
    user = Usuario.new
    user.nombre = params[:nombre]
    user.password = (params[:pass])
    user.fechaNacimiento = params[:fecha]
    user.peso = params[:peso]
    user.email = params[:email]
    if user.save
      
    else
      
    end
  end

end
require 'net/http'

FitnessTime::App.controllers :sessions do
  
  get :login, :map => '/login' do
    @usuario = Usuario.new
    render 'sessions/nuevo'
  end

  post :create do
    email = params[:usuario][:email]
    password = params[:usuario][:password]
    begin
      response = handle_request_for_login(email, password)
    #  securityToken = SecurityToken.json_create(response.body)
    #  response.body["emailUsuario"]
      if response_ok?(response)
        sign_in JSON.parse(response.body)
    #    sign_in securityToken
        redirect '/'
      else
        @usuario = params[:usuario]
        flash.now[:error] = 'Usuario o password invalidos'
        render 'sessions/nuevo'
      end
    rescue Exception
    #  @usuario = Usuario.new
    #  flash.now[:error] = 'Error del servidor, intente nuevamente.'
    #  render 'sessions/nuevo'
    end
  end

  get :destroy, :map => '/logout' do 
    begin
      response = handle_request_for_close_session()
      if(response_ok?(response))
        sign_out
      else
        flash.now[:error] = 'No se puede cerrar sesion.'
      end
      redirect '/'
    rescue Exception
      raise Exception, 'Error al cerrar sesion'
    end
  end

end
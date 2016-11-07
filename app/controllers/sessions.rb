require 'net/http'

FitnessTime::App.controllers :sessions do
  
  get :login do
    @usuario = Usuario.new
    render 'sessions/nuevo'
  end

  post :create do
    email = params[:usuario][:email]
    password = params[:usuario][:password]
    begin
      response = handle_request_for_login(email, password)
      if response_ok?(response)
        sign_in JSON.parse(response.body)
        redirect '/rutinas/all'
      else
        @usuario = Usuario.new
        flash.now[:danger] = 'Usuario o password invalidos'
        render 'sessions/nuevo'
      end
    rescue Exception
      @usuario = Usuario.new
      flash.now[:danger] = 'Error del servidor, intente nuevamente.'
      render 'sessions/nuevo'
    end
  end

  get :destroy, :map => '/logout' do 
    begin
      response = handle_request_for_close_session()
      if(response_ok?(response))
        sign_out
      else
        flash.now[:danger] = 'No se puede cerrar sesion.'
      end
      redirect '/'
    rescue Exception
      raise Exception, 'Error al cerrar sesion'
    end
  end

end
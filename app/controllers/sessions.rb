require 'net/http'

FitnessTime::App.controllers :sessions do
  
  get :login, :map => '/login' do
    @usuario = Usuario.new
    render 'sessions/nuevo'
  end

  post :create do
    email = params[:usuario][:email]
    password = params[:usuario][:password]
    #begin

      response = Request.get_request("/login?email=" + email + "&pass=" + password)
      
    #  securityToken = SecurityToken.json_create(response.body)
    #  response.body["emailUsuario"]
      if (response.code == "200")
        sign_in JSON.parse(response.body)
    #    sign_in securityToken
        redirect '/'
      else
        @usuario = params[:usuario]
        flash.now[:error] = 'Usuario o password invalidos'
        render 'sessions/nuevo'
      end
    #rescue Exception
    #  @usuario = Usuario.new
    #  flash.now[:error] = 'Error del servidor, intente nuevamente.'
    #  render 'sessions/nuevo'
    #end
  end

  get :destroy, :map => '/logout' do 
    sign_out
    redirect '/'          
  end

end
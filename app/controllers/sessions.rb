require 'net/http'
require "json"

FitnessTime::App.controllers :sessions do
  
  get :login, :map => '/login' do
    @usuario = Usuario.new
    render 'sessions/nuevo'
  end

  post :create do
    email = params[:usuario][:email]
    password = params[:usuario][:password]
    
    response = Request.get_request("http://localhost:3001/autenticar/" + email + "/" + password)
    securityToken = SecurityToken.json_create(JSON.parse(response.body))
    if (securityToken.idUsuario == 0)
      @usuario = Usuario.new
      flash.now[:error] = 'Usuario o password invalidos'
      render 'sessions/nuevo'
    else
      sign_in securityToken
      redirect '/'          
    end
  end

  get :destroy, :map => '/logout' do 
    sign_out
    redirect '/'          
  end

end
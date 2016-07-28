require 'chartkick'
include Chartkick::Helper

FitnessTime::App.controllers :estadisticas do
  
  get :marcas do
    render 'estadisticas/marcas'
  end

  post :crear do
  end

end
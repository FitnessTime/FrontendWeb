require 'chartkick'
include Chartkick::Helper

FitnessTime::App.controllers :estadisticas do
  
  get :marcas do
  	response = handle_request_for_all_marcas()
    if (response_ok?(response))
    	$estadisticas = JSON.parse(response.body)
    else
      $estadisticas = Array.new(0)
    end
    render 'estadisticas/marcas'
  end

  get :pasos do
    response = handle_request_for_all_pasos_por_dia()
    if (response_ok?(response))
      $pasos = JSON.parse(response.body)
    else
      $pasos = Array.new(0)
    end
    render 'estadisticas/pasos'
  end

  post :crear do
  end

end
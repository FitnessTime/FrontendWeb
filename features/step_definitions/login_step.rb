
Then(/^Hay un usuario loggeado con el nombre "(.*?)"$/) do |content|
  page.should have_content(content)
end

Given(/^No hay un usuario con el nombre "(.*?)"$/) do |nombre|
  hayUsuario = false
    Usuario.all.each do |t|
        if(t.nombre==nombre)
            hayUsuario = true
            t.destroy
        end
    end
    expect(hayUsuario).to eq(false)
end

Given(/^Estoy en la pagina de loggeo$/) do
  visit '/login'
end

Given(/^Hay un usuario creado "(.*?)" con contrasenia "(.*?)"$/) do |email, pass|
  visit '/registrar'
	fill_in('usuario[nombre]', :with =>  "test")
	fill_in('usuario[email]', :with =>  email)
	fill_in('usuario[fechaNacimiento]', :with =>  "17/02/1992")
	fill_in('usuario[peso]', :with =>  "76")
	fill_in('usuario[password]', :with =>  pass)
	fill_in('usuario[confirmacion_password]', :with =>  pass)
	click_button('Crear')
	visit '/login'
end

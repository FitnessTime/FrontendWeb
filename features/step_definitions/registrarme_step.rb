Given(/^Estoy en la pagina principal$/) do
  visit '/'
end

When(/^Hago click en el link "(.*?)"$/) do |link|
  click_link(link)
end

When(/^Hago click en el boton "(.*?)"$/) do |button|
  click_button(button)
end


Then(/^Estoy en la pagina de registro$/) do
  page.should have_content('Registro')
end

When(/^Ingreso el usuario "(.*?)"$/) do |usuario|
  fill_in('usuario[nombre]', :with =>  usuario)
end

When(/^Ingreso el mail "(.*?)"$/) do |email|
  fill_in('usuario[email]', :with =>  email)
end

When(/^Ingreso la fecha de nacimiento "(.*?)"$/) do |fecha|
  fill_in('usuario[fechaNacimiento]', :with =>  fecha)
end

When(/^Ingreso el peso "(.*?)"$/) do |peso|
  fill_in('usuario[peso]', :with =>  peso)
end

When(/^Ingreso la contrasenia "(.*?)"$/) do |pass|
  fill_in('usuario[password]', :with =>  pass)
end

When(/^Confirmo la contrasenia "(.*?)"$/) do |confirm_pass|
  fill_in('usuario[confirmacion_password]', :with =>  confirm_pass)
end

Then(/^Hay un usuario creado con el nombre "(.*?)"$/) do |nombre|
  hayUsuario = false
    Usuario.all.each do |t|
        if(t.nombre==nombre)
            hayUsuario = true
            t.destroy
        end
    end
    expect(hayUsuario).to eq(true)
end

Then(/^Veo un mensaje "(.*?)"$/) do |mensaje|
  page.should have_content(mensaje)
end

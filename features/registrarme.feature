#Feature: Pagina de registro
 
#    Como Usuario
#    Quiero registrarme ingresando usuario, email, fecha de nacimiento, peso y contraseña.

#    Scenario: Registrarme exitosamente.
#        Given Estoy en la pagina principal
#        When Hago click en el link "registrate"
#        Then Estoy en la pagina de registro
#        When Ingreso el usuario "Test"
#        And Ingreso el mail "test@gmail.com"
#        And Ingreso la fecha de nacimiento "17/02/1992"
#        And Ingreso el peso "76"
#        And Ingreso la contrasenia "test1234"
#        And Confirmo la contrasenia "test1234"
#        When Hago click en el boton "Crear"
#        Then Hay un usuario creado con el nombre "Test"
#        Then Veo un mensaje "Usuario creado"

#    Scenario: Registrarme fallido por falta del campo usuario.
#        Given Estoy en la pagina principal
#        When Hago click en el link "registrate"
#        Then Estoy en la pagina de registro
#        When Ingreso el mail "test@gmail.com"
#        And Ingreso la fecha de nacimiento "17/02/1992"
#        And Ingreso el peso "76"
#        And Ingreso la contrasenia "test1234"
#        And Confirmo la contrasenia "test1234"
#        When Hago click en el boton "Crear"
#        Then Veo un mensaje "Es necesario completar los campos"

#    Scenario: Registrarme fallido por falta del campo email.
#        Given Estoy en la pagina principal
#        When Hago click en el link "registrate"
#        Then Estoy en la pagina de registro
#        When Ingreso el usuario "Test"
#        And Ingreso la fecha de nacimiento "17/02/1992"
#        And Ingreso el peso "76"
#        And Ingreso la contrasenia "test1234"
#        And Confirmo la contrasenia "test1234"
#        When Hago click en el boton "Crear"
#        Then Veo un mensaje "Es necesario completar los campos"

#    Scenario: Registrarme fallido por falta del campo fecha.
#        Given Estoy en la pagina principal
#        When Hago click en el link "registrate"
#        Then Estoy en la pagina de registro
#        When Ingreso el usuario "Test"
#        And Ingreso el mail "test@gmail.com"
#        And Ingreso el peso "76"
#        And Ingreso la contrasenia "test1234"
#        And Confirmo la contrasenia "test1234"
#        When Hago click en el boton "Crear"
#        Then Veo un mensaje "Es necesario completar los campos"

#    Scenario: Registrarme fallido por falta del campo peso.
#        Given Estoy en la pagina principal
#        When Hago click en el link "registrate"
#        Then Estoy en la pagina de registro
#        When Ingreso el usuario "Test"
#        And Ingreso el mail "test@gmail.com"
#        And Ingreso la fecha de nacimiento "17/02/1992"
#        And Ingreso la contrasenia "test1234"
#        And Confirmo la contrasenia "test1234"
#        When Hago click en el boton "Crear"
#        Then Veo un mensaje "Es necesario completar los campos"

#    Scenario: Registrarme fallido por contraseñas no coincidentes.
#        Given Estoy en la pagina principal
#        When Hago click en el link "registrate"
#        Then Estoy en la pagina de registro
#        When Ingreso el usuario "Test"
#        And Ingreso el mail "test@gmail.com"
#        And Ingreso la fecha de nacimiento "17/02/1992"
#        And Ingreso el peso "76"
#        And Ingreso la contrasenia "test1234"
#        And Confirmo la contrasenia "test123"
#        When Hago click en el boton "Crear"
#        Then Veo un mensaje "Password no coinciden"
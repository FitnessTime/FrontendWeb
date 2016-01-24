#Feature: Pagina de loggeo
   
#    Como Usuario
#    Quiero loggearme ingresando un usuario/email y contraseña.

#    Scenario: Loggearme con un email exitosamente.
#        Given Estoy en la pagina de loggeo
#        And Hay un usuario creado "test@gmail.com" con contrasenia "test1234"
#        When Ingreso el mail "test@gmail.com"
#        And Ingreso la contrasenia "test1234"
#        When Hago click en el boton "Login"
#        Then Hay un usuario loggeado con el nombre "test@gmail.com"

#    Scenario: Loggearme con un usuario fallido.
#        Given Estoy en la pagina de loggeo
#        And No hay un usuario con el nombre "TestFalla"
#        When Ingreso el mail "TestFalla"
#        And Ingreso la contrasenia "1234"
#        When Hago click en el boton "Login"
#        Then Veo un mensaje "Usuario o password invalidos"
        
#    Scenario: Loggearme con contraseña fallida.
#        Given Estoy en la pagina de loggeo
#        And Hay un usuario creado "test@gmail.com" con contrasenia "test1234"
#        When Ingreso el mail "Test"
#        And Ingreso la contrasenia "test123"
#        When Hago click en el boton "Login"
#        Then Veo un mensaje "Usuario o password invalidos"
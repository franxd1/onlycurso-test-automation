*** Settings ***
Resource    ../Resources/Steps/HU02_Acessar_Tela_de_Cadastro_Resource.resource
Suite Setup    Abrir Navegador       

**Test Cases***
CN01 - Navegação para o cadastro bem-sucedida
	Dado que o usuário acessa a pagina de login
    E preenche o campo de email com "perfilteste12025@gmail.com" 
    E preenche o campo de senha com "perfilteste12025"
	E não possui uma conta cadastrada
	Quando ele clica no link "Cadastre-se"
	Então o sistema deve direcioná-lo para a tela de criação de conta
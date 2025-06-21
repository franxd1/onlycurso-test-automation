*** Settings ***
Library        SeleniumLibrary
Library    XML
Resource        ../variables/GlobalVariables.resource
Resource    ../Steps/HU01_Autenticar_Usuario_Resource.resource
Resource        CommosResource.resource
*** Keywords ***

#DADO
Dado que o usuário acessa a pagina de login
    acessar login
#QUANDO
Quando ele clica no link "Cadastre-se"
    ir para a pagina de cadastro
#E
E preenche o campo de email com "perfilteste12025@gmail.com"
      preencher campo email    perfilteste12025@gmail.com
E preenche o campo de senha com "perfilteste12025"
    preencher campo senha    perfilteste12025
E não possui uma conta cadastrada
    logar
    Validar mensagem de erro
#ENTÃO 
Então o sistema deve direcioná-lo para a tela de criação de conta
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/cadastro
    Close Browser


ir para a pagina de cadastro
    Click Element    ${Login_link_para_Cadastro}
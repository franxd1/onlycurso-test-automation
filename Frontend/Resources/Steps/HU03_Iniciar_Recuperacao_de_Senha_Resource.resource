*** Settings ***
Library        SeleniumLibrary
Library    XML
Resource        ../variables/GlobalVariables.resource
Resource        CommosResource.resource
*** Keywords ***

#DADO
Dado que o usuário acessa a tela de login
    acessar login
    
#QUANDO
Quando ele clica no link "Esqueci minha senha"
     ir para a pagina de reuperar senha
#E
E não se lembra da sua senha
   preencher campo email    isaias.legend@gmail.com
#ENTÃO
Então o sistema deve direcioná-lo para a tela de recuperação de senha
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/recuperar-senha         
    Close Browser

ir para a pagina de reuperar senha
    Set Focus To Element    ${Login_link_para_Recupera_Senha}    
    Click Element    ${Login_link_para_Recupera_Senha} 
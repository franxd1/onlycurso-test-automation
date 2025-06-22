*** Settings ***
Library        SeleniumLibrary
Library    XML
Resource        ../variables/GlobalVariables.resource
Resource        CommosResource.resource
Resource    ../Steps/HU01_Autenticar_Usuario_Resource.resource
*** Keywords ***

#DADO
Dado que o usuário está logado no sistema
    acessar login
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/login
    preencher campo email    perfilteste1@gmail.com
    preencher campo senha    perfilteste1@
    logar


#QUANDO
Quando ele clica na opção "Sair"
    Deslogar usuario
#E
E acessa o menu principal
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/aluno
#ENTÃO
Então o sistema deve encerrar sua sessão e redirecioná-lo para a tela de login
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/login
    Close Browser
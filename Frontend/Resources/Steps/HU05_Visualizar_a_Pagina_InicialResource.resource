*** Settings ***
Library        SeleniumLibrary
Library    XML
Resource        ../variables/GlobalVariables.resource
Resource        ../variables/Credenciais.resource
Resource        CommosResource.resource
Resource    ../Steps/HU01_Autenticar_Usuario_Resource.resource
*** Keywords ***
#DADO
Dado que o usuário fez login com sucesso
   acessar login
    preencher campo email    ${User_Email}
    preencher campo senha    ${User_Senha}
    logar
    
    
      
#QUANDO
Quando é direcionado para a tela inicial
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/aluno
#E
E uma lista com titulo "Meus cursos"
    Wait Until Element Is Visible    ${Home_Titulo_da_Lista_Meus_Cursos}
    ${Text}    Get Text    ${Home_Titulo_da_Lista_Meus_Cursos}
    Should Be Equal    ${Text}     Meus Cursos
    Close Browser
    

#ENTÃO
Então o sistema deve exibir o nome do usuário
    Wait Until Element Is Visible    ${Home_Nome_do_Usuario}
    Sleep    3s
    ${Text}    Get Text    ${Home_Nome_do_Usuario}
    Should Be Equal    ${Text}     ${User_Nome}

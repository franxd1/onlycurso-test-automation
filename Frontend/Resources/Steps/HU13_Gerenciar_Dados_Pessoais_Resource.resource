*** Settings ***
Library        SeleniumLibrary
Library    XML
Resource        ../variables/GlobalVariables.resource
Resource        CommosResource.resource
Resource    ../Steps/HU01_Autenticar_Usuario_Resource.resource
*** Keywords ***

#DADO
Dado que o usuário está na página "Meus Dados"
    acessar login
    preencher campo email    perfilteste1@gmail.com
    preencher campo senha    perfilteste1@
    logar
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/aluno
    acessar tela Meus dados
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/dados    

Dado que o usuário já está na página "Meus Dados"
    acessar tela Meus dados
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/dados    
#QUANDO
Quando ele clica em "Editar", altera o valor e salva
     
    Sleep    5s
    Wait Until Element Is Visible    ${Meus_Dados_Profissao_atual}
    ${Profissao}    Get Text    ${Meus_Dados_Profissao_atual}
    Log To Console    ${Profissao}
    IF    '${Profissao}' == 'Progamador'
        Set Focus To Element    ${Meus_Dados_Botao_editar_profissao}
        Click Element    ${Meus_Dados_Botao_editar_profissao}
        Set Focus To Element    ${Meus_Dados_Input_Editar_profissao}
        Input Text    ${Meus_Dados_Input_Editar_profissao}    Designer
        Click Button    ${Meus_Dados_Salvar_Edicao_de_profissao}
        Sleep    3s
        Wait Until Element Is Visible    ${Meus_Dados_Profissao_atual}
        ${NovaProfissao}    Get Text    ${Meus_Dados_Profissao_atual}
        Should Be Equal    ${NovaProfissao}   Designer
        ${Profissao}=    Set Variable    Designer
       
    ELSE
     Set Focus To Element    ${Meus_Dados_Botao_editar_profissao}
        Click Element    ${Meus_Dados_Botao_editar_profissao}
        Set Focus To Element    ${Meus_Dados_Input_Editar_profissao}
        Input Text    ${Meus_Dados_Input_Editar_profissao}    Progamador
        Click Button    ${Meus_Dados_Salvar_Edicao_de_profissao}
        Sleep    3s
        Wait Until Element Is Visible    ${Meus_Dados_Profissao_atual}
        ${NovaProfissao}    Get Text    ${Meus_Dados_Profissao_atual}
        Should Be Equal    ${NovaProfissao}   Progamador
        ${Profissao}=    Set Variable    Progamador
        
    END
    Set Global Variable    ${Profissao}

Quando ele visualiza o campo "CPF"
    validar se existe campo CPF
    
#E
E identifica o campo "Profissão" disponível para edição
    Wait Until Element Is Visible    ${Meus_Dados_Campo_Profissao}
    Wait Until Element Is Visible    ${Meus_Dados_Botao_editar_profissao}
    

#ENTÃO
Então o novo valor deve ser exibido no campo
  Sleep    4s
  Wait Until Element Is Visible    ${Meus_Dados_Profissao_atual}
  ${Meus_Dados_Profissao_atual_text}    Get Text    ${Meus_Dados_Profissao_atual} 
  Should Be Equal    ${Meus_Dados_Profissao_atual_text}    ${Profissao}

Então o campo "CPF" deve estar marcado como inalterável
    validar e inalteravel




validar se existe campo CPF
     ${text}    Get Text   ${Meus_Dados_Identificdor_do_Campo_CPF}
    Should Be Equal     ${text}    Cpf
    

validar e inalteravel
     ${text}    Get Text   ${Meus_Dados__Campo_CPF_Inalteravel}
    Should Be Equal     ${text}    Inalterável
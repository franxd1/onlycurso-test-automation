*** Settings ***
Library        SeleniumLibrary
Library    XML
Resource        ../variables/GlobalVariables.resource
*** Keywords ***
Abrir Navegador  
     Open Browser    ${LinkNavegador}    chrome
acessar login
    Wait Until Element Is Visible  ${BotaoEntrar}
    Set Focus To Element    ${BotaoEntrar}
    Click Element    ${BotaoEntrar}
preencher campo email  
    [Arguments]    ${Email}
    Set Focus To Element    ${Login_Input_Email}
    Input Text    ${Login_Input_Email}    ${Email}
    
Deslogar usuario
    Click Element    ${Home_Botao_Sair}

Validar Que Estou Na Pagina
    [Arguments]    ${url_da_pagina}
    Wait Until Keyword Succeeds    10s    1s    Location Should Be    ${url_da_pagina}

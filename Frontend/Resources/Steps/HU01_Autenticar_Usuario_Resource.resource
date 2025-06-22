*** Settings ***
Library        SeleniumLibrary
Library    XML
Resource        ../variables/GlobalVariables.resource
Resource        CommosResource.resource
*** Keywords ***
#DADO
Dado que o usuário acessa a página de login
    acessar login
    
Dado que o usuário esta na página de login
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/login
#QUANDO
Quando o usuário preenche o campo de e-mail com "isaias.legend@gmail.com"
    preencher campo email    perfilteste1@gmail.com

Quando o usuário preenche o campo de e-mail com "naoexiste@exemplo.com"
    preencer dados de email invalidos


#E
E clica no botão "Entrar"
    logar

E preenche o campo de senha com "Isaias123@"
    preencher campo senha    perfilteste1@
    
E preenche o campo de senha com "QualquerSenha123"
    preencher campo senha com senha invalida

#ENTÃO 
Então o sistema deve redirecionar o usuário para a Página Inicial
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/aluno
    Deslogar usuario

Então o sistema deve exibir a mensagem de erro "Usuário ou senha inválidos"
    Validar mensagem de erro
    Close Browser



preencer dados de email invalidos
    Set Focus To Element    ${Login_Input_Email}
    Input Text    ${Login_Input_Email}    naoexiste@exemplo.com

preencher campo senha 
  [Arguments]  ${Senha}
    Set Focus To Element    ${Login_Input_Email}
    Input Text    ${Login_Input_Senha}    ${Senha}
preencher campo senha com senha invalida 
     Set Focus To Element    ${Login_Input_Email}
    Input Text    ${Login_Input_Senha}    QualquerSenha123

    
logar
    Click Element    ${Login_Botao_Entrar}



Validar mensagem de erro
    
    Wait Until Element Is Visible  ${Login_Mensagem_Credencias_invalidas}
    Set Focus To Element    ${Login_Mensagem_Credencias_invalidas}
    ${texto}    Get Text    ${Login_Mensagem_Credencias_invalidas}
    Should Be Equal    ${texto}   Credenciais inválidas.
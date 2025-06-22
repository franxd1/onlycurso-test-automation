*** Settings ***
Library        SeleniumLibrary
Library    XML
Resource        ../variables/GlobalVariables.resource
Resource        ../variables/Credenciais.resource
Resource        CommosResource.resource
Resource    ../Steps/HU01_Autenticar_Usuario_Resource.resource
*** Keywords ***

#DADO
Dado que o usuário está na pagina "Meus Dados"
    acessar login
    preencher campo email    perfilteste1@gmail.com
    preencher campo senha    perfilteste1@
    logar
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/aluno
    acessar tela Meus dados
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/dados

Dado que o usuário está no formulário de alteração de senha
    sleep    4s
    Validar Que Estou Na Pagina    https://only-cursos.vercel.app/dados 
#QUANDO
Quando insere uma nova senha válida com confirmação e salva
    Set Focus To Element    ${Meus_Dados_Input_Senha_Nova}
    Input Text    ${Meus_Dados_Input_Senha_Nova}    ${User_Senha}1
    Click Element    ${Meus_Dados_Botao_Salvar_Nova_Senha} 
    Sleep    2s
    ${text}    Get Text    ${Meus_Dados_Mensagem_de_Confirmacao_Senha_atualizada}
    Should Be Equal     ${text}    Senha alterada com sucesso!

Quando ele insere a senha atual incorretamente 
    acessar formulario de senha
    Set Focus To Element    ${Meus_Dados_Input_Senha_Atual}
    Input Text    ${Meus_Dados_Input_Senha_Atual}    Senhaincorreta
    Set Focus To Element    ${Meus_Dados_Input_Senha_Nova}
    Input Text    ${Meus_Dados_Input_Senha_Nova}    ${User_Senha}
    Click Element    ${Meus_Dados_Botao_Salvar_Nova_Senha} 
    
    
#E
E acessa o formulário de alteração de senha
    acessar formulario de senha

E informa a senha atual corretamente
    Set Focus To Element    ${Meus_Dados_Input_Senha_Atual}
    Input Text    ${Meus_Dados_Input_Senha_Atual}    ${User_Senha}  
      
    

        
#ENTÃO
Então o sistema deve exibir a mensagem "Senha alterada com sucesso"
    Wait Until Element Is Visible    ${Meus_Dados_Mensagem_de_Confirmacao_Senha_atualizada}
    Set Focus To Element    ${Meus_Dados_Mensagem_de_Confirmacao_Senha_atualizada}  
    ${text}    Get Text    ${Meus_Dados_Mensagem_de_Confirmacao_Senha_atualizada}
    Should Be Equal     ${text}    Senha alterada com sucesso!
    alterar senha

Então o sistema deve exibir a mensagem "A senha atual está incorreta"

    Wait Until Element Is Visible    ${Meus_Dados_Mensagem_de_Confirmacao_Senha_atualizada}
    sleep    2s
    Set Focus To Element    ${Meus_Dados_Mensagem_de_Confirmacao_Senha_atualizada}  
    ${text}    Get Text    ${Meus_Dados_Mensagem_de_Confirmacao_Senha_atualizada}
    Should Be Equal     ${text}    Credenciais inválidas.
   
    
acessar formulario de senha
 
    Wait Until Element Is Visible    ${Meus_Dados_Botao_Alterar_senha}
    Click Element    ${Meus_Dados_Botao_Alterar_senha}


alterar senha
    acessar formulario de senha
    Set Focus To Element    ${Meus_Dados_Input_Senha_Atual}
    Input Text    ${Meus_Dados_Input_Senha_Atual}    ${User_Senha}1
    Set Focus To Element    ${Meus_Dados_Input_Senha_Nova}
    Input Text    ${Meus_Dados_Input_Senha_Nova}    ${User_Senha}
    Click Element    ${Meus_Dados_Botao_Salvar_Nova_Senha} 
    
    



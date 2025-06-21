*** Settings ***
Resource    ../Resources/Steps/HU01_Autenticar_Usuario_Resource.resource
Suite Setup    Abrir Navegador       


**Test Cases***
CN1 - Login com credenciais válidas
    Dado que o usuário acessa a página de login
    Quando o usuário preenche o campo de e-mail com "isaias.legend@gmail.com"
    E preenche o campo de senha com "Isaias123@"
    E clica no botão "Entrar"
    Então o sistema deve redirecionar o usuário para a Página Inicial
CN2 - Login com e-mail não cadastrado
    Dado que o usuário esta na página de login
    Quando o usuário preenche o campo de e-mail com "naoexiste@exemplo.com"
    E preenche o campo de senha com "QualquerSenha123"
    E clica no botão "Entrar"
    Então o sistema deve exibir a mensagem de erro "Usuário ou senha inválidos"

  
   
   
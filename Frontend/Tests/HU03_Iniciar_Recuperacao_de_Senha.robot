*** Settings ***
Resource    ../Resources/Steps/HU03_Iniciar_Recuperacao_de_Senha_Resource.resource
Suite Setup    Abrir Navegador       

**Test Cases***
CN01 - Navegação para a recuperação de senha
    Dado que o usuário acessa a tela de login
    E não se lembra da sua senha
    Quando ele clica no link "Esqueci minha senha"
    Então o sistema deve direcioná-lo para a tela de recuperação de senha
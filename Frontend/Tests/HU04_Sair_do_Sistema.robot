*** Settings ***
Resource    ../Resources/Steps/HU04_Sair_do_Sistema_Resource.resource
Suite Setup    Abrir Navegador       

**Test Cases***
CN01 - Logout bem-sucedido
    Dado que o usuário está logado no sistema
    E acessa o menu principal
    Quando ele clica na opção "Sair"
    Então o sistema deve encerrar sua sessão e redirecioná-lo para a tela de login
*** Settings ***
Resource    ../Resources/Steps/HU14_Alterar_Senha_da_Conta_Resource.resource
Suite Setup    Abrir Navegador       

**Test Cases***
CN01 - Alteração de senha bem-sucedida
    Dado que o usuário está na pagina "Meus Dados" 
    E acessa o formulário de alteração de senha
    E informa a senha atual corretamente
    Quando insere uma nova senha válida com confirmação e salva
    Então o sistema deve exibir a mensagem "Senha alterada com sucesso"
CN02- Tentativa com senha atual incorreta 
	Dado que o usuário está no formulário de alteração de senha 
	Quando ele insere a senha atual incorretamente 
	Então o sistema deve exibir a mensagem "A senha atual está incorreta"
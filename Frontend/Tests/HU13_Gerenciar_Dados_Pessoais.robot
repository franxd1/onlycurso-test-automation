*** Settings ***
Resource    ../Resources/Steps/HU13_Gerenciar_Dados_Pessoais_Resource.resource
Suite Setup    Abrir Navegador       

**Test Cases***
CN01- Edição de campo bem-sucedida 
	Dado que o usuário está na página "Meus Dados"
	E identifica o campo "Profissão" disponível para edição
	Quando ele clica em "Editar", altera o valor e salva
	Então o novo valor deve ser exibido no campo
CN02 - Tentativa de editar campo inalterável
	Dado que o usuário já está na página "Meus Dados" 
	Quando ele visualiza o campo "CPF" 
	Então o campo "CPF" deve estar marcado como inalterável
	
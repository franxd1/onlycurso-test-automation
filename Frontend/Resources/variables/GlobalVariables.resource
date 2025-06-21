*** Settings ***

*** Variables ***
${LinkNavegador}        https://only-cursos.vercel.app/

#Tela de apresentação 
${BotaoEntrar}    xpath=/html/body/div/nav/div[1]/ul/li[4]/a 
#Tela inicial 
${Home_Botao_Pagina_Inicial}    xpath=/html/body/div/div/nav/div/ul/li[1]/a
${Home_Meus_Cursos}       xpath=/html/body/div/main/section[2]/h2
${Home_Botao_Sair}        xpath=/html/body/div/div/nav/div/div[2]/button

#Tela de Login
${Login_Input_Email}    xpath=/html/body/div/div/form/div[1]/input
${Login_Input_Senha}    xpath=//*[@id="senha"]
${Login_Botao_Entrar}    xpath=/html/body/div/div/form/button
${Login_Mensagem_Credencias_invalidas}    xpath=/html/body/div/div/form/p
${Login_link_para_Cadastro}    xpath=/html/body/div/div/div/p[2]/a
${Login_link_para_Recupera_Senha}    xpath=/html/body/div/div/div/p[1]/a

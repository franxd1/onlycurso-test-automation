*** Settings ***
Resource    ../Resources/Steps/HU05_Visualizar_a_Pagina_InicialResource.resource
Suite Setup    Abrir Navegador       

**Test Cases***
CN01 - Visualização da dashboard
    Dado que o usuário fez login com sucesso
    Quando é direcionado para a tela inicial
    Então o sistema deve exibir o nome do usuário
    E uma lista com titulo "Meus cursos"
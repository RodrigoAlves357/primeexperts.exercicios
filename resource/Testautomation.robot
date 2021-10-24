** Settings ***

Library     SeleniumLibrary

*** Variables ***

${BROWSER}      Chrome
${URL}          http://automationpractice.com

** Keywords ***
Abrir Navegador
        Open Browser            Aboult:Blank           ${BROWSER}

Fechar Navegador
        Close Browser


Acessar a pagina home do site
        [Documentation]         Palavra utilizada em todos os testes
        Go to           ${URL}
        Maximize Browser Window
        Title Should Be         My Store


Digita o nome do produto "${PRODUTO}" no campo de Pesquisar

        input Text      name=search_query     ${PRODUTO}


Clicar no botão Pesquisar
        Click Element           name=submit_search

################################################################################################################################################
###  TESTE 1
Conferir se o produto "${PRODUTO}" foi listado no site
     Wait Until Element Is Visible              xpath=//*[@id="center_column"]//h1//span[1]
        Scroll Element Into View                 xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[1]/span
        Title Should Be                            Search - My Store
        Page Should Contain Image                xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]

        Capture Page Screenshot        

##############################################################################################################################################################
## - TESTE 2

Conferir mensagem de erro "${PRODUTO}"
        Title Should Be                         Search - My Store
        Wait Until Element Is Visible           xpath=//p[@class='alert alert-warning']
        Element Should Be Visible               xpath=//p[@class='alert alert-warning']
        Capture Page Screenshot

##############################################################################################################################################################
## - TESTE 3

Passar o mouse por cima da categoria "${PRODUTO}" no menu principal superior de categorias
        Wait Until Element Is Visible           xpath=//*[@id="block_top_menu"]/ul/li[1]/a
        Mouse Over                              xpath=//*[@id="block_top_menu"]/ul/li[1]/a
        Capture Page Screenshot

Clicar na sub categoria "${PRODUTO}"
        Click Element                           xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Conferir se os produtos da sub-categoria "${PRODUTO}" foram mostrados na página
        Scroll Element Into View                xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/span/span
        Page Should Contain Image               xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img
        Page Should Contain Image               xpath=//*[@id="center_column"]/ul/li[2]/div/div[1]/div/a[1]/img
        Wait Until Element Is Visible           xpath=//*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a
        Capture Page Screenshot
######################################################################################################################################
## - TESTE 4

Clicar em "Sign in"
        Click Element           xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

Informar um e-mail válido
        Wait Until Element Is Visible            xpath=//label[@for='email_create'][text()='Email address']
        Input Text          xpath=//*[@id="email_create"]    ser_mais_que_unanime@hotmail.com

Clicar em "Create an Account"
        Click Element           xpath=//*[@id="SubmitCreate"]/span

Preencher os Dados obrigatório
        Wait Until Element Is Visible           xpath=//h1[text()='Create an account']
        Input Text                              name=customer_firstname    Rodrigo
        Input Text                              name=customer_lastname      Augusto
        Input Password                           name=passwd     caramelo1234
        Input Text                              xpath=//*[@id="address1"]               Redmond
        Input Text                              xpath=//*[@id="city"]                   Albuquerque
        Select From List By Value               name=id_state         47
        Input Text                              xpath=//*[@id="postcode"]               98052
        Input Text                              xpath=//*[@id="phone_mobile"]    882-8080
        Click Element                           xpath=//*[@id="submitAccount"]/span          
Conferir se o cadastro foi efetuado com sucesso
        Wait Until Element Is Visible           xpath=//*[@id="center_column"]/h1
        Capture Page Screenshot
        
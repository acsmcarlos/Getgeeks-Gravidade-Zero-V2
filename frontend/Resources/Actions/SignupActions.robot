*** Settings ***
Documentation    Ações do sistema Signup Actions

*** Keywords ***
### Dado que acesso a pagina de cadastro
Go To Signup Form
    Go To    ${URL_BASE}/signup

    Wait For Elements State    css=.signup-form    visible    30

## Quando faço o meu cadastro com o nome completo, email e senha
Fill Signup Form
    [Arguments]    ${user}

    Fill Text    id=name        ${user}[firstname]
    Fill Text    id=lastname    ${user}[lastname]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]

Submit Signup Form
    Click    css=.submit-button >> text=Cadastrar


## Então vejo a mensagem de boas vindas
# usuário deve ser cadastrado
User Should Be Registered

    ${expected_message}    Set Variable    css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

    Wait For Elements State    ${expected_message}    visible    5




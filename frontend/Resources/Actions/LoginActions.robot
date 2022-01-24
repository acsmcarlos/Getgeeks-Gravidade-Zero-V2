*** Settings ***
Documentation    Ações do sistema de Login Actions

*** Variables ***
${INPUT_EMAIL}    id=email
${INPUT_PASS}     id=password

*** Keywords ***
Go To Login Page
    Go To    ${URL_BASE}

    Wait For Elements State    css=.login-form    visible    30


Fill Credentials
    [Arguments]    ${user}

    Fill Text    ${INPUT_EMAIL}    ${user}[email]
    Fill Text    ${INPUT_PASS}     ${user}[password]


Submit Credentials
    Click    css=.submit-button >> text=Entrar

# validação do profile
User Should Be Logged In
    [Arguments]    ${user}

    ${path}                 Set Variable    css=a[href="/profile"]
    ${expected_fullname}    Set Variable    ${user}[firstname] ${user}[lastname]

    Wait For Elements State    ${path}    visible    5
    Get Text                   ${path}    equal      ${expected_fullname}

# Validando o tipo email no html
Should Be Type Email
    Get Property    ${INPUT_EMAIL}    type    equal    email
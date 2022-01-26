*** Settings ***
Documentation    Suit de testes de cadastro de usuário/clientes no getgeeks

Resource    ../Resources/Base.robot

Test Setup       Start Session
Test Teardown    After Test


*** Test Cases ***
Register a New User
    [Tags]    smoke

    ${user}    Factory User    user

    # Disponibilizar a massa a nível de suíte
    # Set Suite Variable    ${user}

    Go To Signup Form
    Fill Signup Form             ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate User
    ${user}    Factory User    user

    ## Incluir o usuário direto no bando de dados antes de validar se o mesmo já existe
    Add User From Database    ${user}

    Go To Signup Form
    Fill Signup Form           ${user}
    Submit Signup Form
    Modal Content Should Be    Já temos um usuário com o e-mail informado.

Incorrect Email
    ${user}    Factory User     incorrect_email

    Go To Signup Form
    Fill Signup Form        ${user}
    Submit Signup Form
    Alert Span Should Be    O email está estranho

# Cenário com template - validar todas as mensagens uma por uma
Required Fields
    # [Template]    Signup Submit Without Form

    @{expected_alerts}    Create List
    ...                   Cadê o seu nome?
    ...                   E o sobrenome?
    ...                   O email é importante também!
    ...                   Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form
    Alert Spans Should Be    ${expected_alerts}

# Cenário com template - validando todas as mensagens uma por uma
Short Password
    [Template]    Signup With Short Pass

    1
    12
    123
    1234
    12345
    a
    a2
    ab3
    ab3c
    a23bc
    -&%$#
    -@)(=

#     LEVAR PRO SIGNUP ACTIONS
*** Keywords ***
Signup With Short Pass
    [Arguments]    ${short_pass}

    ${user}    Create Dictionary
    ...        firstname=Antonio          lastname=Carlos
    ...        email=antonio@gmail.com    password=${short_pass}

    Go To Signup Form
    Fill Signup Form        ${user}
    Click     css=button[type=button]
    Submit Signup Form
    Alert Span Should Be    Informe uma senha com pelo menos 6 caracteres

# Signup Submit Without Form
#    [Arguments]    ${expected_alert}

#    Go To Signup Form
#    Submit Signup Form
#    Alert Span Should Be    ${expected_alert}
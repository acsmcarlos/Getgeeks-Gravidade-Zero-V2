*** Settings ***
Documentation    Suit de testes de login de usuário no getgeeks

Resource    ../Resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
User Login
    [Tags]    smoke

    # massa de dados exclusiva para login
    ${user}    Factory User     login

    # ## Incluir o usuário(massa de dados) direto no bando de dados antes de validar se o mesmo já existe
    # Add User From Database    ${user}

    # Preenchendo o formulário de login com a massa de dados acima
    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]    inc_pass

    ${user}    Create Dictionary    email=acsmcarlos@gmail.com    password=abc123

    Go To Login Page
    Fill Credentials           ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.

User Not Found | 404
    [Tags]    user_404

    ${user}    Create Dictionary    email=acsmcarlos3@gmail.com    password=123456

    Go To Login Page
    Fill Credentials           ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.

Incorrect Email | Email
    [Tags]    inc_email

    ${user}    Create Dictionary    email=acsmcarlos&gmail.com    password=123456

    Go To Login Page
    Fill Credentials      ${user}
    Submit Credentials

    # Validando o tipo email
    Should Be Type Email

# DESAFIO
Required Email
    [Tags]    desafio

    ${user}    Create Dictionary    email=${EMPTY}    password=123456

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be    E-mail obrigatório

Required Pass
    [Tags]    desafio

    ${user}    Create Dictionary    email=acsmcarlos3@gmail.com    password=${EMPTY}

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be    Senha obrigatória

Required Fields
    [Tags]    desafio3

    @{expected_alerts}    Create List
    ...                   E-mail obrigatório
    ...                   Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be    ${expected_alerts}

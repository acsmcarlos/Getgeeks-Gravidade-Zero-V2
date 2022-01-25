*** Settings ***
Documentation    Helper utilizado adicionar o usuário antes de validar se ele já existe

*** Keywords ***
Add User From Database
    [Arguments]    ${user}

    Connect To Postgres
    Insert User Database        ${user}
    Disconnect From Database

Do Login
    [Arguments]    ${user}

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}    # validação do profile


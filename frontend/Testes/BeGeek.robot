*** Settings ***
Documentation    Suit de testes de Be Geeks.

Resource    ../Resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Be a Geek
    [Tags]    smoke

    # Dado que tenho um usuário comum (Kim Dotcom)
    ${user}    Factory User    be_geek

    # E faço login na plataforma Getgeeks (tenho que estar logado para submeter o formulário)
    Do Login    ${user}

    # Quando submeto o formulário para me tornar um Geek (prestador de serviços)
    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form

    # Então devo ver a mensagem de sucesso
    Geek Form Should Be Success






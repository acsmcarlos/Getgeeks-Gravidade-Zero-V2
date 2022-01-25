*** Settings ***
Documentation    Services API

Library    RequestsLibrary


*** Variables ***
${API_GATEWAY}    https://getgeeks-gateway-antonio.herokuapp.com


*** Keywords ***
### Fazer um post na rota session para obter o token
Get Token Service
    [Arguments]    ${user}

    ${payload}    Create Dictionary
    ...           email=${user}[email]
    ...           password=${user}[password]

    ## Acessar diretamente o gateway
    ${response}    POST    ${API_GATEWAY}/sessions    json=${payload}

    ### Obter o token           portador + caminho json
    ${token}    Set Variable    Bearer ${response.json()}[token]

    [Return]    ${token}

### Criar um geek
Be a Geek Service
    [Arguments]    ${payload}    ${token}

    ${headers}    Create Dictionary    Authorization=${token}

    ${response}    POST                   ${API_GATEWAY}/geeks
    ...            json=${payload}
    ...            headers=${headers}

    [Return]    ${response}

Create Geek Profile Service
    [Arguments]    ${user}

    ${token}             Get Token Service        ${user}
    Be a Geek Service    ${user}[geek_profile]    ${token}


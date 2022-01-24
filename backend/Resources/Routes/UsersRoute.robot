*** Settings ***
Documentation    Users route


*** Keywords ***
POST User
    [Arguments]    ${payload}    #Argumento recebe a massa payload

    # Resultado
    ${response}    POST                   
    ...            ${API_USERS}/users     # Rota/url
    ...            json=${payload}        # Massa
    ...            expected_status=any    # status code any

    # Devolve o valor de response
    [Return]    ${response}

DELETE User
    [Arguments]    ${token}    #Argumento recebe o TOKEN

    ${headers}    Create Dictionary    Authorization=${token}    #variável

    # Resultado
    ${response}    DELETE                   
    ...            ${API_USERS}/users     # Rota/url
    ...            headers=${headers}     # Massa(variável)
    ...            expected_status=any    # status code any

    # Devolve o valor de response
    [Return]    ${response}

GET User
    [Arguments]    ${token}    #Argumento recebe o TOKEN

    ${headers}    Create Dictionary    Authorization=${token}    #variável

    # Resultado
    ${response}    GET                   
    ...            ${API_USERS}/users     # Rota/url
    ...            headers=${headers}     # Massa(variável)
    ...            expected_status=any    # status code any

    # Devolve o valor de response
    [Return]    ${response}

PUT User    
    [Arguments]    ${token}    ${payload}    #Argumento recebe o token e a massa payload

    ${headers}    Create Dictionary    Authorization=${token}    #variável

    # Resultado
    ${response}    PUT                   
    ...            ${API_USERS}/users     # Rota/url
    ...            json=${payload}        # Massa
    ...            headers=${headers}     # Massa(variável)
    ...            expected_status=any    # status code any

    # Devolve o valor de response
    [Return]    ${response}
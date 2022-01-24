*** Settings ***
Documentation    Geeks route


*** Keywords ***
POST Geek
    [Arguments]    ${token}    ${payload}    #Argumento recebe a massa payload

    ${headers}    Create Dictionary    Authorization=${token}    #variável

    # Resultado
    ${response}    POST                   
    ...            ${API_GEEKS}/geeks     # Rota/url
    ...            json=${payload}        # Massa
    ...            headers=${headers}     # Massa(variável)
    ...            expected_status=any    # status code any

    # Devolve o valor de response
    [Return]    ${response}

GET Geeks
    [Arguments]    ${token}

    ${headers}    Create Dictionary    Authorization=${token}    #variável

    # Resultado
    ${response}    GET                    
    ...            ${API_GEEKS}/geeks     # Rota/url
    ...            headers=${headers}     # Massa(variável)
    ...            expected_status=any    # status code any

    # Devolve o valor de response
    [Return]    ${response}

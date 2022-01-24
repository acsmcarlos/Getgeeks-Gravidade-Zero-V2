*** Settings ***
Documentation    Sessions route


*** Keywords ***
POST Session
    [Arguments]    ${payload}    #Argumento recebe a massa payload

    # Resultado
    ${response}    POST                     
    ...            ${API_USERS}/sessions    # Rota
    ...            json=${payload}          # Massa
    ...            expected_status=any      # status code any

    # Devolve o valor de response
    [Return]    ${response}
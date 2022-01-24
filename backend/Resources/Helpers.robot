*** Settings ***
Documentation    Helpers


*** Keywords ***
Get Token
    [Arguments]    ${user}

    # Massa local ---- Obtendo o token
    ${payload}    Create Dictionary             
    ...           email=${user}[email]          
    ...           password=${user}[password]

    # requisição na rota session para ober o token do JSON, faz o POST e pega o resultado
    ${response}    POST Session    ${payload}    # requisição
    ${result}      Set Variable    ${EMPTY}     # variável vazio para receber o token
    
    # se o o response retornar 200 com token, armazena no result
    IF    '200' in "${response}"
        ${result}    Set Variable    Bearer ${response.json()}[token]    # obtendo o token
    END
    
    [Return]    ${result}    # variavel com/sem o token


Remove User
    [Arguments]    ${user}

    ${token}    Get Token    ${user}

    ## Se tiver o token, deleta o usuário
    IF    "${token}"
        ## DELETE na rota /users (encerramento da conta)
        ## deletando um usuário já existente (e se não tiver esse usuário no banco?)
        DELETE User       ${token}
        # Log To Console    \nToken: ${token}
    END
    # Se nao tiver token(não tem usuário), então passa direto
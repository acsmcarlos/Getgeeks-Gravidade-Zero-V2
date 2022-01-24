*** Settings ***
Documentation    Suite de testes da api Geeks

Resource    ../Resources/Base.robot


*** Test Cases ***
Be a Geek
### Dado que temos um novo usuário
    ${user}    Factory Be Geek

    Remove User    ${user}

### E esse usuário é um cliente comum
    POST User    ${user}

### E esse usuário possui um token válido
    ${token}    Get Token    ${user}

### Quando faço uma requisição POST na rota /geeks
    ${response}    POST Geek    ${token}    ${user}[geek_profile]

### Então deve retornar 201
    Status Should Be    201    ${response}

### E ao consultar esse usuário na API Users
    ${response}    Get User    ${token}

### Então o perfil geek deve ser retornado
    Should Be True    ${response.json()}[id] > 0

    Should Be Equal As Strings    ${user}[name]                            ${response.json()}[name]
    Should Be Equal As Strings    ${user}[email]                           ${response.json()}[email]
    Should Be Equal As Strings    ${user}[geek_profile][whatsapp]          ${response.json()}[whatsapp]
    Should Be Equal As Strings    ${user}[geek_profile][desc]              ${response.json()}[desc]
    Should Be Equal As Numbers    ${user}[geek_profile][cost]              ${response.json()}[cost]
    Should Be Equal As Strings    ${user}[geek_profile][printer_repair]    ${response.json()}[printer_repair]
    Should Be Equal As Strings    ${user}[geek_profile][work]              ${response.json()}[work]
    Should Be Equal As Strings    None                                     ${response.json()}[avatar]            
    Should Be Equal As Strings    True                                     ${response.json()}[is_geek]           

Get Geek List
    [Tags]    list

    ${data}    Factory Search For Geeks

    FOR     ${geek}    IN     @{data}[geeks]
        
        POST User    ${geek}
        ${token}    Get Token    ${geek}

        POST Geek    ${token}    ${geek}[geek_profile]

    END

    ## Cadastrar usuário
    POST User    ${data}[user]

    ## Obter o token do usuário autenticado
    ${token}    Get Token    ${data}[user]

    ${response}         GET Geeks    ${token}
    Status Should Be    200          ${response}

    Log    ${response.json()}[Geeks]

    ${total}    Get Length    ${response.json()}[Geeks]

    Log    Total: ${total}
    Log To Console    \nTotal: ${total}

    Should Be True    ${total} > 0

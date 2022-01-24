*** Settings ***
Documentation    Suite de testes da api Users


Resource    ../Resources/Base.robot


*** Test Cases ***
Add New User    # Criar um novo usuário na API
    [Tags]    add_user

    ${user}        Factory New User    # Massa de testes vindo do User.py

    Remove User    ${user}

    ## Garantir que o usuário esteja cadastrado
    POST User    ${user}      
    ${token}     Get Token    ${user}    ## Obter o token

    ## Método GET
    ${response}    GET User    ${token}

    ## Validar o ID
    # Armazenar o ID na variavel user_id
    ${user_id}        Set Variable      ${response.json()}[id]
    Should Be True    ${user_id} > 0


# Extrair o token do Remove User
Get User Data

    ${user}    Factory Get User

    # Excluindo massa antes de inserir novamente
    Remove User    ${user}

    ## Garantir que o usuário esteja cadastrado
    POST User    ${user}      
    ${token}     Get Token    ${user}    ## Obter o token

    ## Método GET
    ${response}    GET User    ${token}

    # Todas as validações...
    Status Should Be    200    ${response}

    Should Be Equal As Strings    ${user}[name]     ${response.json()}[name]
    Should Be Equal As Strings    ${user}[email]    ${response.json()}[email]

    Should Be True                ${response.json()}[id] > 0
    Should Be Equal As Strings    ${response.json()}[whatsapp]    None
    Should Be Equal As Strings    ${response.json()}[avatar]      None
    Should Be Equal As Strings    ${response.json()}[is_geek]     False


Remove User
    [Tags]    remove_user
    
##### GHERKIN
#### Dado que existe um usuário no sistema
    ${user}    Factory Remove User

    # # Excluindo massa antes de inserir novamente
    # Remove User    ${user}

#### E tenho um token desse usuário
    # Garantir que o usuário esteja cadastrado
    POST User    ${user}      
    ${token}     Get Token    ${user}    ## Obter o token

#### Quando faço uma solicitação de remoção na rota /users
    # Método DELETE
    ${response}    DELETE User    ${token}

#### Então deve retornar o status code 204 (no content)
    # Todas as validações...
    Status Should Be    204    ${response}

#### E ao fazer uma requisição GET, deve retornar o status code 404 (not found)
    ${response}         GET User    ${token}
    Status Should Be    404         ${response}


Update User
    [Tags]    update
    
    ${user}    Factory Update User

    # Cadastrar o usuário com os dados 'before'
    POST User    ${user}[before]

    # Obter um token do usuário cadastrado
    ${token}    Get Token    ${user}[before]

    # Atualizar os dados do usuário 'after' com o token e o payload do PUT User
    ${response}    PUT User    ${token}    ${user}[after]

    Status Should Be    200         ${response}
    ${response}         GET User    ${token}

    Should Be Equal As Strings    ${user}[after][name]        ${response.json()}[name]
    Should Be Equal As Strings    ${user}[after][email]       ${response.json()}[email]
    Should Be Equal As Strings    ${user}[after][whatsapp]    ${response.json()}[whatsapp]
    Should Be Equal As Strings    ${user}[after][avatar]      ${response.json()}[avatar]
    Should Be Equal As Strings    False                       ${response.json()}[is_geek]


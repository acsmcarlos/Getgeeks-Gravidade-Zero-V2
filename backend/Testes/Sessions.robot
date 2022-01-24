*** Settings ***
Documentation    Suite de testes da api sessions


Resource    ../Resources/Base.robot


*** Variables ***
# Massas de teste usadas no template
&{inv_pass}       email=rafael@gmail.com    password=12erro
&{inv_email}      email=rafael&gmail.com    password=123456
&{email_404}      email=rafael@404.com      password=12erro
&{empty_email}    email=${EMPTY}            password=12erro
&{sem_email}      password=123456
&{empty_pass}     email=rafael@gmail.com    password=${EMPTY}
&{sem_pass}       email=rafael@gmail.com


*** Test Cases ***
User Session       #Login na API

    ##### DADO que temos um usuário cadastrado
    ## Cadastrar um usuário na API
    ${payload}     Factory User Session    signup        # A massa(usuário)
    ${response}    POST User               ${payload}    # o cadastro da massa(usuário)
    
    ## Massa pra fazer o login na API
    ${payload}    Factory User Session    login
    
    #### QUANDO faço uma requisição POST na rota /sessions
    ## Testar uma API REST    -----   SessionsRoute
    ## LOGIN
    ${response}    POST Session    ${payload}
    
    #### ENTÃO o status code deve ser 200
    # Validar o status code
    Status Should Be    200    ${response}    #
    
    #### E deve gerar um token jwt
    # Validar os caracteres do token
    ${size}    Get Length    ${response.json()}[token]
    
    Log To Console    \nToken: ${response.json()}[token]
    Log To Console    Expira em: ${response.json()}[expires_in]
    Log To Console    Tamanho: ${size}
    
    Should Be Equal As Integers    ${size}    139
    
    #### E esse token deve expirar em 10 dias
    Should Be Equal    10d    ${response.json()}[expires_in]


Should Not Get Token
    [Template]    Attempt POST Session
    
    ${inv_pass}       401    Unauthorized
    ${inv_email}      400    Incorrect email
    ${email_404}      401    Unauthorized
    ${empty_email}    400    Required email
    ${sem_email}      400    Required email
    ${empty_pass}     400    Required pass
    ${sem_pass}       400    Required pass


*** Keywords ***
Attempt POST Session
    [Arguments]    ${payload}    ${status_code}    ${error_message}
    
    ${response}    POST Session    ${payload}
    
    Status Should Be    ${status_code}      ${response}
    Should Be Equal     ${error_message}    ${response.json()}[error]


# Incorrect Pass | Senha incorreta
#    ## Massa
#    ${payload}    Create Dictionary    email=rafael@gmail.com    password=12356

#    ### Testar uma API REST
#    ${response}                POST Session    ${payload}

#    # Validar o status code
#    Status Should Be           401             ${response}
#    Should Be Equal            Unauthorized    ${response.json()}[error]

#    log to console    \nErro: ${response.json()}[error] ${response}

# User Not Found | Email incorreto
#    ## Massa
#    ${payload}    Create Dictionary    email=rafael@404.com    password=123456

#    ### Testar uma API REST
#    ${response}                POST Session    ${payload}

#    # Validar o status code
#    Status Should Be           401             ${response}
#    Should Be Equal            Unauthorized    ${response.json()}[error]

#    log to console    \nErro: ${response.json()}[error] ${response}

# Incorrect Email | Email incorreto
#    ## Massa
#    ${payload}    Create Dictionary    email=rafael.com.br    password=123456

#    ### Testar uma API REST
#    ${response}                POST Session    ${payload}

#    # Validar o status code
#    Status Should Be           400                ${response}
#    Should Be Equal            Incorrect email    ${response.json()}[error]

#    log to console    \nErro: ${response.json()}[error] ${response}


# Empty Email | Email vazio
#    ## Massa
#    ${payload}    Create Dictionary    email=${EMPTY}    password=123456

#    ### Testar uma API REST
#    ${response}                POST Session    ${payload}

#    # Validar o status code
#    Status Should Be           400               ${response}
#    Should Be Equal            Required email    ${response.json()}[error]

#    log to console    \nErro: ${response.json()}[error] ${response}


# Without Email | Sem o campo email
#    ## Massa
#    ${payload}    Create Dictionary    password=123456

#    ### Testar uma API REST
#    ${response}                POST Session    ${payload}

#    # Validar o status code
#    Status Should Be           400               ${response}
#    Should Be Equal            Required email    ${response.json()}[error]

#    log to console    \nErro: ${response.json()}[error] ${response}

# Empty Pass | Senha vazio
#    ## Massa
#    ${payload}    Create Dictionary    email=acsmcarlos@gmail.com    password=${EMPTY}

#    ### Testar uma API REST
#    ${response}                POST Session    ${payload}

#    # Validar o status code
#    Status Should Be           400              ${response}
#    Should Be Equal            Required pass    ${response.json()}[error]

#    log to console    \nErro: ${response.json()}[error] ${response}


# Without Pass | Sem o campo senha
#    ## Massa
#    ${payload}    Create Dictionary    email=acsmcarlos@gmail.com 

#    ### Testar uma API REST
#    ${response}                POST Session    ${payload}

#    # Validar o status code
#    Status Should Be           400              ${response}
#    Should Be Equal            Required pass    ${response.json()}[error]

#    log to console    \nErro: ${response.json()}[error] ${response}
*** Settings ***
Documentation    Conexão com o banco de dados (database helpers)

Library    DatabaseLibrary
Library    Factories/Users.py



*** Keywords ***
Connect To Postgres
#... 1 driver    = psicopg2
#... 2 databaseName = ditrxkrh
#... 3 databaseUser = ditrxkrh
#... 4 senha       = j6POGYdA4L3MqS4JE4FrRyQ8cVW3AKzN
#... 5 servidor    = fanny.db.elephantsql.com
#... 6 porta padrao = 5432

### BANCO DE DADOS Nº 01
    Connect To Database    psycopg2
    ...                    siewzdxw
    ...                    siewzdxw
    ...                    qO7xDHyrm-3tOEVNAIvFLxjU3HI0WEgi
    ...                    drona.db.elephantsql.com
    ...                    5432

# Deletar registros no banco
Reset Env
    Execute SQL String    DELETE FROM geeks;
    Execute SQL String    DELETE FROM users WHERE email IN ('tony@stark.com', 'acsmcarlos@gmail.com', 'kim@gmail.com', 'peter@einerd.com', 'rafael@gmail.com');

Insert User Database
    [Arguments]    ${u}

    # guardar a senha criptografada
    ${hashed_pass}    Get Hashed Pass    ${u}[password]

    # adicionar o usuário antes de validar se ele já existe
    ${query}    Set Variable    INSERT INTO users (name, email, password_hash, is_geek) VALUES ('${u}[firstname] ${u}[lastname]', '${u}[email]', '${hashed_pass}', false)

    # ${query}    Set Variable    INSERT INTO users (name, email, password_hash, is_geek) VALUES ('${u}[firstname] ${u}[lastname]', '${u}[email]', '${u}[password_hash]', false)

    Execute SQL String    ${query}

# Semeadura de massa de teste
Users Seed

    ${user}                 Factory User    login
    Insert User Database    ${user}

    ${user2}                Factory User    be_geek
    Insert User Database    ${user2}

    ${user3}                Factory User    attempt_be_geek
    Insert User Database    ${user3}
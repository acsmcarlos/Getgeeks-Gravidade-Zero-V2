*** Settings ***
Documentation    Database | Limpeza do banco de dados

Resource    ../Resources/Base.robot

*** Tasks ***
Back To The Past
    
    Connect To Postgres
    Reset Env     # Apaga registros específicos no banco
    Users Seed    # Insere um usuário no banco
    Disconnect from Database

    # INSERIR REGISTROS DIRETO NO BANCO DE DADOS
    # insert into users (name, email, password_hash) 
    # VALUES ('Tony Stark', 'tony@stark.com', '$2b$08$YxQ/TaA7.owpqpHdiL6NxOfP/aY3myilk34RMTxMZ6HQPGrxX6VvC');
*** Settings ***
Documentation    Suite de testes de busca de geeks

Resource    ../Resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session


*** Test Cases ***
Search For Alien Geek

    ## Inserindo Dok Ock (Alien)
    ${alien}    Factory User    search_alien

    Create Geek Profile Service    ${alien}

    ## Pessoa que vai buscar pelo prestador de serviço
    ${searcher}    Factory User    searcher_alien
    Do Login       ${searcher}

    Go To Geeks
    Fill Search Form    Sim    ${EMPTY}    #Impressora a Jato
    Submit Search Form


    # Sleep    4

    ### validações
    # Wait For Elements State    css=.message span >> text=1                      visible    5
    # Wait For Elements State    css=.geek strong >> text=Dok Ock                 visible    5
    # Wait For Elements State    css=.geek span >> text=Atendimento presencial    visible    5
    # Wait For Elements State    css=footer strong >> text=350.00                 visible    5


Search For Common Geek

   ## Inserindo Peter Parker (Common)
    ${common}    Factory User    search_common

    Create Geek Profile Service    ${common}

## Pessoa que vai buscar pelo prestador de serviço
    ${searcher}    Factory User    searcher_common
    Do Login       ${searcher}

    Go To Geeks
    Fill Search Form    ${EMPTY}    Removo o Baidu
    Submit Search Form
    # Sleep    4

*** Settings ***
Documentation    Suite de testes de busca de geeks

Resource    ../Resources/Base.robot

Test Setup       Start Session
Test Teardown    After Test


*** Test Cases ***
Search For Alien Geek

    ## Inserindo Dok Ock (Alien)
    ${alien}    Factory User    search_alien

    Create Geek Profile Service    ${alien}

    ## Pessoa que vai buscar pelo prestador de serviço
    ${searcher}    Factory User    searcher_alien
    Do Login       ${searcher}

    Go To Geeks
    Fill Search Form      Sim    Matricial a fita colorida
    Submit Search Form

    Geek Should Be Found            ${alien}
    Alien Icon Should Be Visible


Search For Common Geek

    ## Inserindo Dok Ock (Alien)
    ${common}    Factory User    search_common

    Create Geek Profile Service    ${common}

    ## Pessoa que vai buscar pelo prestador de serviço
    ${searcher}    Factory User    searcher_common
    Do Login       ${searcher}

    Go To Geeks
    Fill Search Form      Não    PC X86 ou X64
    Submit Search Form

    Geek Should Be Found            ${common}


Search Not Found

    ## Pessoa que vai buscar pelo prestador de serviço
    ${searcher}    Factory User    searcher_common
    Do Login       ${searcher}

    Go To Geeks
    Fill Search Form      Não    Conserto Game Atari da Polivox
    Submit Search Form

    Geek Not Found

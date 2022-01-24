*** Settings ***
Documentation    Suite de tentativas de se tornar Geeks. 

Resource    ../Resources/Base.robot

Suite Setup    Start Session For Attempt For Be Geek
#Teste a nível de suíte
Test Template    Attempt Be a Geek    


*** Variables ***
${long_desc}    Eu posso formatar o seu computador, instalando o windows 10 e 11, e também o Linux Mint ou Ubuntu (recomendado para iniciantes). Além disso, consigo remover qualquer vírus, malware e até mesmo o baidoo. Tudo de forma profissional, e com a garantia de 2 anos.


*** Test Cases ***
# Should Not Be a Geek
#    [Template]    Attempt Be a Geek    

## Teste Case         key               input_field         output_message
Short Desc            desc              Formato o seu PC    A descrição deve ter no minimo 80 caracteres         #short desc
Long Desc             desc              ${long_desc}        A descrição deve ter no máximo 255 caracteres        #long desc
Empty Desc            desc              ${EMPTY}            Informe a descrição do seu trabalho                  #empty desc
Whats Only DDD        whats             12                  O Whatsapp deve ter 11 digitos contando com o DDD    #short whats
Whats Only Number     whats             123456789           O Whatsapp deve ter 11 digitos contando com o DDD    #short whats
Empty Whats           whats             ${EMPTY}            O Whatsapp deve ter 11 digitos contando com o DDD    #short whats
Cost Letters          cost              aaaa                Valor hora deve ser numérico                         #short hora(cost)
Cost Alpha            cost              aa12                Valor hora deve ser numérico                         #short hora(cost)
Cost Special Chars    cost              &*()%$#@            Valor hora deve ser numérico                         #short hora(cost)
Empty Cost            cost              ${EMPTY}            Valor hora deve ser numérico                         #empty hora(cost)
Empty Printer         printer_repair    ${EMPTY}            Por favor, informe se você é um Geek Supremo         #empty printer_repair
Empty Work            work              ${EMPTY}            Por favor, selecione o modelo de trabalho            #empty work


*** Keywords ***
Attempt Be a Geek
    [Arguments]    ${key}    ${input_field}    ${output_message}

    ${user}    Factory User    attempt_be_geek

    Set To Dictionary    ${user}[geek_profile]    ${key}    ${input_field}

    Fill Geek Form          ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be    ${output_message}

    Take Screenshot    fullPage=True    filename=AttemptBeGeek_{index}


Start Session For Attempt For Be Geek

    ${user}    Factory User    attempt_be_geek

    Start Session
    Do Login           ${user}
    Go To Geek Form

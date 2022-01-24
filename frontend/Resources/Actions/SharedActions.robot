*** Settings ***
Documentation    Shared Actions | Modal de alerts do sistema

*** Keywords ***
Modal Content Should Be
    [Arguments]    ${expected_text}

    ${title_text}      Set Variable    css=.swal2-title
    ${element_text}    Set Variable    css=.swal2-html-container 

    Wait For Elements State    ${title_text}    visible    5
    Get Text                   ${title_text}    equal      Oops...

    Wait For Elements State    ${element_text}    visible    5
    Get Text                   ${element_text}    equal      ${expected_text}

Alert Span Should Be
    [Arguments]    ${expected_alert}

    Wait For Elements State    css=span[class=error] >> text=${expected_alert}    visible    5

Alert Spans Should Be
    [Arguments]    ${expected_alerts}

    @{got_alerts}    Create List

    ${spans}    Get Elements    css=span[class=error]

    FOR    ${span}    IN    @{spans}

        ${text}           Get Text         ${span}    
        Append To List    ${got_alerts}    ${text}

    END

    Lists Should Be Equal    ${expected_alerts}    ${got_alerts}
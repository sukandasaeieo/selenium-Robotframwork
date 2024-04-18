*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                Chrome
${URL}                    https://practice.expandtesting.com/notification-message-rendered
${CLICK_BUTTON}         xpath=//a[contains(text(),'Click here')]
${UNSUCCESSFUL_MESSAGE}   Action unsuccessful, please try again
${SUCCESSFUL_MESSAGE}     Action successful!
${TIMEOUT}                10s  

*** Test Cases ***
Wait For Click And Verify Result Test
    Open Browser               ${URL}             ${BROWSER}
    Wait Until Page Contains Element  ${CLICK_BUTTON}   ${TIMEOUT}
    ${is_button_visible}       Run Keyword And Return Status   Element Should Be Visible   ${CLICK_BUTTON} 
    Run Keyword If             '${is_button_visible}' == 'True'
    ...                        Click Element      ${CLICK_BUTTON} 
    ...                        ELSE               Fail   Button not visible within timeout
    ${is_successful}           Run Keyword And Return Status   Wait Until Page Contains   ${TIMEOUT}   ${SUCCESSFUL_MESSAGE}
    ${is_unsuccessful}         Run Keyword And Return Status   Wait Until Page Contains   ${TIMEOUT}   ${UNSUCCESSFUL_MESSAGE}
    Run Keyword If             ${is_successful}    Log    Successful message detected
    Run Keyword If             ${is_unsuccessful}  Log    Unsuccessful message detected
    ...                   

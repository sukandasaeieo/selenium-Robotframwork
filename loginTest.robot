*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers
Test Teardown    Close Browser

*** Variables ***
${LOGIN_URL}    https://practice.expandtesting.com/login
${USERNAME}    practice
${PASSWORD}    SuperSecretPassword!
${EXPECTED_TITLE}    You logged into a secure area!
${BROWSER}    Chrome

*** Test Cases ***
Open browser and login
    Open Browser    ${LOGIN_URL}    browser=${BROWSER}
    Input Text    id = username    ${USERNAME}
    Input Password   id = password    ${PASSWORD}
    Click Button    css:button[type='submit'] 
     Wait Until Page Contains Element    css=.alert-success    timeout=20s
    ${success_message}=    Get Text    css=.alert-success
    Should Be Equal As Strings    ${success_message}    ${EXPECTED_TITLE}

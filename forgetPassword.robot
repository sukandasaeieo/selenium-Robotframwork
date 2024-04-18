*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers
Test Teardown    Close Browser

*** Variables ***
${LOGIN_URL}    https://practice.expandtesting.com/forgot-password
${EMAIL}    test12334@gmail.com
${EXPECTED_TITLE}    An e-mail has been sent to you which explains how to reset your password
${BROWSER}    Chrome

*** Test Cases ***
Open browser and login
    Open Browser    ${LOGIN_URL}    browser=${BROWSER}
    Input Text    id = email  ${EMAIL} 
    Click Button    //*[@id="forgot_password"]/button 
    Wait Until Page Contains Element    id= confirmation-alert    timeout=20s
    ${success_message}    Get Text    id= confirmation-alert

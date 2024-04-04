*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    https://practice.expandtesting.com/add-remove-elements

*** Test Cases ***
Add And RemoveElements Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Add Elements
    Remove Elements
    Close Browser

*** Keywords ***
Add Elements
    Click Element    xpath=//button[@onclick='addElement()']
    Sleep    1s

Remove Elements
    Click Element    xpath=//button[@onclick='deleteElement()']
    Sleep    1s

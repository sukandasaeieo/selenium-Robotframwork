*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    https://practice.expandtesting.com/add-remove-elements

*** Test Cases ***
Add And RemoveElements Test
    Open Browser    ${URL}    ${BROWSER}
    Add Elements
    Remove Elements
    Close Browser

*** Keywords ***
Add Elements
    Click Element    xpath=//button[@onclick='addElement()']
    Sleep    2s

Remove Elements
    Click Element    xpath=//button[@onclick='deleteElement()']
    Sleep    2s

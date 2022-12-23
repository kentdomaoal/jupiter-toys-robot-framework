*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../Resources/Locators.py

*** Variables ***
${browser}  headlesschrome
${url}  https://www.google.com
${searchText}     Robot Framework


*** Test Cases ***
Search Test
#    open browser    ${url}  ${browser}
#    Search for       ${searchText}

    ${priceValue}=   get regexp matches  -$20.99   [+-]?\\d+(.\\d+)?
    ${priceValueFloat}=   convert to number    ${priceValue}[0]
    log to console   ${priceValueFloat}

#    close browser

*** Keywords ***
Search for
    [Arguments]     ${searchText}
    input text      xpath://input[@title='Search']  ${searchText}
    #click element   xpath://body[1]/div[1]/div[3]/form[1]/div[1]/div[1]/div[4]/center[1]/input[1]
    #click element   xpath://div[4]/center/input[@name='btnK']
    click element   (//div[4]/center/input[@name='btnK'])
    #click element   xpath://div[4]/center/input[@name='btnI']


successMessageForUser ${user}
    ${message} =    replace string    ${SUCCESS_MESSAGE}    <user>     ${user}
    RETURN  ${message}
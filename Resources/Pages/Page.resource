*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../Locators.py
#Variables    ../Config/robot-config-qa.py


*** Keywords ***
User opens Jupiter Toys website
    open browser    ${base_url}  ${browser}
#    maximize browser window
    set window size     ${window_width}     ${window_height}

Close Application
    close all browsers

Given
    [Arguments]    @{varargs}
    run keyword    @{varargs}

A User navigates to ${page} page
    click element   partial link:${page}

click the ${buttonName} button
    ${buttonLocator}=   get button  ${buttonName}
    wait until element is visible   ${buttonLocator}
    click element   ${buttonLocator}

get button
    [Arguments]    ${buttonName}
    ${buttonLocator}=    replace string  ${buttonXpath}  <button>    ${buttonName}
    [Return]    ${buttonLocator}

get price value
    [Arguments]    ${product}   ${xpath}
    ${priceLocator}=    replace string    ${xpath}  <productName>    ${product}
    wait until element is visible   ${priceLocator}
    ${priceText}=  get text    ${priceLocator}
    ${priceValueFloat}=  get float value    ${priceText}
    [Return]    ${priceValueFloat}

get float value
    [Arguments]     ${priceText}
    ${priceValue}=   get regexp matches  ${priceText}   ${priceFloatXpath}
    ${priceValueFloat}=   convert to number    ${priceValue}[0]
    [Return]    ${priceValueFloat}
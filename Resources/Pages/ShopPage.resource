*** Settings ***
Library    SeleniumLibrary
Library    RPA.Excel.Files
Library    String
Library    Collections
Variables    ../Locators.py
Resource    Page.resource

*** Keywords ***
user buys products
    @{shoppingList}=    get shopping list
    set suite variable  @{shoppingList}
    A User navigates to Shop page
    get product prices  @{shoppingList}
    buy products    @{shoppingList}

get shopping list
    Open Workbook   ${testdata_shoppinglist_xlsx}
    @{shoppingList}=    Read Worksheet     header=True
    [Return]    @{shoppingList}

get product prices
    [Arguments]    @{shoppingList}
    ${productPriceMap}  Create Dictionary
    FOR    ${product}   IN    @{shoppingList}
        ${priceValue}=  get price value     ${product}[\$\{productName\}]   ${productPriceXpath}
        set to dictionary   ${productPriceMap}  ${product}[\$\{productName\}]     ${priceValue}
    END
    set suite variable  &{productPriceMap}

buy products
    [Arguments]     @{shoppingList}
    FOR    ${product}   IN    @{shoppingList}
        buy product     ${product}[\$\{productName\}]   ${product}[\$\{quantity\}]
    END

buy product
    [Arguments]     ${product}  ${quantity}
    ${buyButtonLocator}=    get buy button  ${product}
    FOR    ${index}    IN RANGE    ${quantity}
        click element    ${buyButtonLocator}
    END

get buy button
    [Arguments]    ${product}
    ${buttonLocator}=    replace string  ${buyButtonXpath}  <productName>    ${product}
    [Return]    ${buttonLocator}




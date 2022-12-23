*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   Page.resource

*** Keywords ***
user validates subtotal for each product
    log to console    user validates subtotal for each product


subtotal for each product should be correct
    ${subtotalList}=    create list
    @{shoppingList}=    get variable value  $shoppingList
    FOR    ${product}   IN    @{shoppingList}
        ${productName}=     convert to string    ${product}[\$\{productName\}]
        ${cartPageSubtotal}=  get price value   ${productName}  ${cartProductSubtotalXpath}
        ${subTotal}=    evaluate    ${productPriceMap['${productName}']} * ${product}[\$\{quantity\}]
        append to list  ${subtotalList}     ${subTotal}
        should be equal     ${cartPageSubtotal}     ${subtotal}
    END
    log to console    Subtotals: ${subtotalList}
    set suite variable  ${subtotalList}

user validates price for each product
    log to console    user validates price for each product


price for each product should be correct
    @{shoppingList}=    get variable value  $shoppingList
    FOR    ${product}   IN    @{shoppingList}
        ${productName}=     convert to string    ${product}[\$\{productName\}]
        ${cartPagePrice}=   get price value   ${productName}  ${cartProductPriceXpath}
        ${shopPagePrice}=   convert to number    ${productPriceMap['${productName}']}
        should be equal     ${cartPagePrice}    ${shopPagePrice}
    END

user validates the total amount
    log to console    user validates the total amount

total amount should be the sum of subtotals
    ${totalAmount}=     get total
    ${subtotalList}=    get variable value  $subtotalList
    ${sumOfSubtotals}=  evaluate    sum(map(float, ${subtotalList}))
    should be equal     ${totalAmount}  ${sumOfSubtotals}

get total
    ${totalAmountText}=  get text    ${totalAmountXpath}
    ${totalValueFloat}=  get float value    ${totalAmountText}
    [Return]    ${totalValueFloat}
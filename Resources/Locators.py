# Common Element Locators
buttonXpath = "xpath://a[contains(text(),'<button>')]"

# Contact Page Locators and Variables
ERROR_MESSAGE = "but we won't get it unless you complete the form correctly"
FIELD_ERROR_MESSAGE = "<field> is required"
SUCCESS_MESSAGE = "Thanks <user>, we appreciate your feedback."

alertSuccessMessage = "class:alert-success"
alertErrorMessage = "class:alert-error"
forenameErrorMessage = "id:forename-err"
emailErrorMessage = "id:email-err"
messageErrorMessage = "id:message-err"

forenameTextbox = "id:forename"
emailTextbox = "id:email"
messageTextbox = "id:message"

# Shop Page Locators and Variables
buyButtonXpath = "//h4[contains(text(),'<productName>')]/following-sibling::p/a"
productPriceXpath = "//h4[contains(text(),'<productName>')]/following-sibling::p/span"
priceFloatXpath = "[+-]?\\d+(.\\d+)?"


# Cart Page Locators
cartProductPriceXpath = "//td[contains(text(),'<productName>')]/following::td[1]"
cartProductSubtotalXpath = "//td[contains(text(),'<productName>')]/following::td[3]"
totalAmountXpath = "//*[contains(@class,'total')]"

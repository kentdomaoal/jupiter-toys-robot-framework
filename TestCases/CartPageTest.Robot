*** Settings ***
Documentation    Jupiter Toys Cart Page Tests
Resource    ../Resources/Pages/Page.resource
Resource    ../Resources/Pages/ShopPage.resource
Resource    ../Resources/Pages/CartPage.resource

Suite Setup    User opens Jupiter Toys website
Suite Teardown  Close Application

Test Setup  Given   user buys products

*** Test Cases ***
Validate prices, subtotal, total in Cart Page
    [Tags]    @Regression   @Smoke
    When a user navigates to Cart page
    And user validates subtotal for each product
    Then subtotal for each product should be correct
    When user validates price for each product
    Then price for each product should be correct
    When user validates the total amount
    Then total amount should be the sum of subtotals
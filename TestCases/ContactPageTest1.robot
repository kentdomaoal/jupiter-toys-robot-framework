*** Settings ***
Documentation    Jupiter Toys Contact Page Tests
Resource    ../Resources/Pages/Page.resource
Resource    ../Resources/Pages/ContactPage.resource

Test Setup    User opens Jupiter Toys website
Test Teardown  Close Application

*** Test Cases ***
Validate error messages for mandatory fields
    [Tags]    @Regression
    Given a User navigates to Contact page
    When click the Submit button
    Then error message should appear
    And error messages for mandatory fields should appear

#    When user populate mandatory fields
    When user populate mandatory fields using: John john.doe@example.com This is a test
    Then error message should not appear
    And error messages for mandatory fields should not appear


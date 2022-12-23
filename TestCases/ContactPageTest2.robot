*** Settings ***
Documentation    Jupiter Toys Contact Page Tests
Resource    ../Resources/Pages/Page.resource
Resource    ../Resources/Pages/ContactPage.resource
#Library     DataDriver   ../${testdata_feedbacks_csv}
Library     DataDriver   ../${testdata_feedbacks_xlsx}     sheet_name=Sheet1

Test Setup    User opens Jupiter Toys website
Test Teardown  Close Application

*** Test Cases ***
Validate successful submission
    [Tags]    @Regression   @Smoke
    [Template]  Validate successful submission using
    ${forename}     ${email}    ${message}


*** Keywords ***
Validate successful submission using
    [Arguments]    ${forename}  ${email}    ${message}
    Given a User navigates to Contact page
    When user populate mandatory fields using: ${forename} ${email} ${message}
    And click the Submit button
    Then successful message should appear for user: ${forename}


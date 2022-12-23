*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../Locators.py


*** Keywords ***
error message should appear
    element should be visible   ${alertErrorMessage}
    element should contain  ${alertErrorMessage}   ${ERROR_MESSAGE}


error messages for mandatory fields should appear
    ${forenameErrorMessage} should appear for Forename field
    ${emailErrorMessage} should appear for Email field
    ${messageErrorMessage} should appear for Message field

${errorMessage} should appear for ${field} field
    ${message}=     replace string    ${FIELD_ERROR_MESSAGE}    <field>     ${field}
    element should be visible   ${errorMessage}
    element should contain  ${errorMessage}    ${message}

#user populate mandatory fields
#    user populate mandatory fields using: John john.doe@example.com This is a test
##    user populate mandatory fields: ${forename} ${email} ${message}

user populate mandatory fields using: ${forename} ${email} ${message}
    wait until element is visible   ${forenameTextbox}  20
    input text  ${forenameTextbox}   ${forename}
    input text  ${emailTextbox}    ${email}
    input text  ${messageTextbox}  ${message}

error message should not appear
    element should not be visible   ${alertErrorMessage}

error messages for mandatory fields should not appear
    element should not be visible   ${forenameErrorMessage}
    element should not be visible   ${emailErrorMessage}
    element should not be visible   ${messageErrorMessage}

#successful message should appear
#    successful message should appear for user: John


successful message should appear for user: ${user}
    wait until element is visible   ${alertSuccessMessage}    20
    element should be visible   ${alertSuccessMessage}
    ${message}=     get success message for     ${user}
    element should contain  ${alertSuccessMessage}    ${message}
#    element should contain  ${alertSuccessMessage}    get success message for     ${user}

get success message for
    [Arguments]    ${user}
    ${message}=     replace string    ${SUCCESS_MESSAGE}    <user>     ${user}
    [Return]    ${message}
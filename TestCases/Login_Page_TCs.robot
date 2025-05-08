*** Settings ***
Resource    ../Resources/setup.resource

Suite Setup    Load web page    ${LOGIN_URL}
Suite Teardown    Close All Browsers

*** Test Cases ***
Validate User able to login with valid credentials
    [Documentation]    Validate User able to login with valid credentials
    [Tags]    smoke
    Wait Until Element Is Visible    ${LOGIN_PAGE_HEADER}
    Login to application with valid credentials
    Sleep    5s
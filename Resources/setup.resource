*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../Suite_Variables/login_page.py
Variables    ../KeyPass_Value/login_page_secret_value.py

*** Keywords ***
Load web page
    [Arguments]    ${LOGIN_URL}
    [Documentation]    Open the web page in the browser.
    ...    Example:    Load web page    https://example.com
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Timeout    10s

Login to application with valid credentials
    [Arguments]    ${username}=NaN    ${password}=NaN
    [Documentation]    Log in to the application with valid credentials.
    ...    Example
    ...    Login to application with valid credentials    username=hii    password=hello
    IF    '${username}' == 'NaN'
        Input Text    ${LOGIN_PAGE_USERNAME}    ${LOGIN_PAGE_USER_KEY}
        Input Text    ${LOGIN_PAGE_PASSWORD}    ${LOGIN_PAGE_PASS_KEY}
    ELSE
        Input Text    ${LOGIN_PAGE_USERNAME}    ${username}
        Input Text    ${LOGIN_PAGE_PASSWORD}    ${password}
    END
    Click Button    ${LOGIN_PAGE_LOGIN_BTN}

Login to application with invalid credentials
    [Arguments]    ${username}=NaN    ${password}=NaN
    [Documentation]    Log in to the application with invalid credentials.
    ...    Example
    ...    Login to application with invalid credentials
    IF    '${username}' == 'NaN'
        ${username}=    Generate Random String    10
        ${password}=    Generate Random String    10    [LETTERS]    [DIGITS]
        Input Text    ${LOGIN_PAGE_USERNAME}    ${username}
        Input Text    ${LOGIN_PAGE_PASSWORD}    ${password}
    ELSE
        Input Text    ${LOGIN_PAGE_USERNAME}    ${username}
        Input Text    ${LOGIN_PAGE_PASSWORD}    ${password}
    END
    Click Button    ${LOGIN_PAGE_LOGIN_BTN}
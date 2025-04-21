*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser
    [Arguments]    ${url}
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Set Selenium Timeout    10s
    Set Page Load Timeout    10s
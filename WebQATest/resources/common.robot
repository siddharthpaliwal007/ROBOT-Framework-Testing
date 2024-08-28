// Contains common keywords that will be reused across different test cases.

*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://demotest-ecommerce.com
${BROWSER}        Chrome
${TIMEOUT}        10 seconds

*** Keywords ***
Open Browser To ECommerce Site
    [Arguments]    ${url}=${BASE_URL}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s
    Set Selenium Timeout  ${TIMEOUT}

Login To ECommerce Site
    [Arguments]    ${username}    ${password}
    Input Text    id=username_field    ${username}
    Input Text    id=password_field    ${password}
    Click Button  id=login_button
    Wait Until Page Contains Element    id=user_profile

Logout From ECommerce Site
    Click Link    id=logout_link
    Wait Until Page Contains Element    id=login_button

Close Browser
    Close All Browsers
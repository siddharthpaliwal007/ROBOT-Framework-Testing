// Login Functionality

*** Settings ***
Resource          common.robot

*** Variables ***
${LOGIN_URL}      ${BASE_URL}/login

*** Keywords ***
Perform Login
    [Arguments]    ${username}    ${password}
    Open Browser To ECommerce Site    ${LOGIN_URL}
    Login To ECommerce Site    ${username}    ${password}
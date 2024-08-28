// Test Case for User Login

*** Settings ***
Resource          ../resources/login.robot
Variables         ../variables/credentials.py

*** Test Cases ***
TC1_User_Login
    [Documentation]    Test user login functionality with valid credentials
    Perform Login    ${username}    ${password}
    Close Browser
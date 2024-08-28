// Test case for validating order history.

*** Settings ***
Resource          ../resources/order_history.robot
Resource          ../resources/login.robot
Variables         ../variables/credentials.py

*** Test Cases ***
TC5_Validate_Order_History
    [Documentation]    Test order history validation
    Perform Login    ${username}    ${password}
    Validate Order History
    Close Browser

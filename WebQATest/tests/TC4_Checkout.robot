// Test case for checkout process

*** Settings ***
Resource          ../resources/checkout.robot
Resource          ../resources/login.robot
Variables         ../variables/credentials.py

*** Test Cases ***
TC4_Proceed_To_Checkout
    [Documentation]    Test the checkout process
    Perform Login    ${username}    ${password}
    Proceed To Checkout
    Complete Checkout
    Close Browser
// Order History Validation

*** Settings ***
Resource          common.robot

*** Keywords ***
Validate Order History
    Click Link    id=order_history_link
    Wait Until Page Contains    "Order History"
    Should Contain    id=order_list    "Order #"
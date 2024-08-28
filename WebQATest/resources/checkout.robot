// Checkout Process

*** Settings ***
Resource          common.robot

*** Keywords ***
Proceed To Checkout
    Click Link    id=cart_link
    Wait Until Page Contains Element    id=checkout_button
    Click Button  id=checkout_button
    Wait Until Page Contains Element    id=order_summary

Complete Checkout
    Input Text    id=address_field    123 Main St
    Input Text    id=city_field       Example City
    Select From List    id=state_field    CA
    Input Text    id=zip_field        12345
    Click Button  id=complete_order_button
    Wait Until Page Contains    "Order Confirmation"
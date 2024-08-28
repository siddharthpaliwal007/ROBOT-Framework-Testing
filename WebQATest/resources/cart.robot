// Cart Functionality

*** Settings ***
Resource          common.robot

*** Keywords ***
Add Product To Cart
    [Arguments]    ${product_name}
    Search For Product    ${product_name}
    Click Button    css=.add-to-cart-button
    Wait Until Page Contains    "Product added to cart"
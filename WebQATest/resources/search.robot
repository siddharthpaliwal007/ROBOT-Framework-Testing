// Product Search Functionality

*** Settings ***
Resource          common.robot

*** Keywords ***
Search For Product
    [Arguments]    ${product_name}
    Input Text    id=search_box    ${product_name}
    Click Button  id=search_button
    Wait Until Page Contains Element    css=.product-list
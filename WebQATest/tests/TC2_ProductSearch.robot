// Test case for searching product

*** Settings ***
Resource          ../resources/search.robot
Resource          ../resources/login.robot
Variables         ../variables/credentials.py

*** Test Cases ***
TC2_Product_Search
    [Documentation]    Test product search functionality
    Perform Login    ${username}    ${password}
    Search For Product    "Laptop"
    Close Browser
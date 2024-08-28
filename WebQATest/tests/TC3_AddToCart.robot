// Test case for adding product to cart

*** Settings ***
Resource          ../resources/cart.robot
Resource          ../resources/login.robot
Variables         ../variables/credentials.py

*** Test Cases ***
TC3_Add_Product_To_Cart
    [Documentation]    Test adding a product to the shopping cart
    Perform Login    ${username}    ${password}
    Add Product To Cart    "Laptop"
    Close Browser
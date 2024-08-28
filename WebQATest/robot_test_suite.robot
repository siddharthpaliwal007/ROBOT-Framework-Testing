// Test suite for running all the tests together.

*** Settings ***
Suite Setup       Open Browser To ECommerce Site
Suite Teardown    Close Browser
Test Setup        Perform Login
Test Teardown     Logout From ECommerce Site

*** Test Cases ***
Run User Login Test
    Run Test Case    TC1_User_Login

Run Product Search Test
    Run Test Case    TC2_Product_Search

Run Add To Cart Test
    Run Test Case    TC3_Add_Product_To_Cart

Run Checkout Test
    Run Test Case    TC4_Proceed_To_Checkout

Run Order History Validation Test
    Run Test Case    TC5_Validate_Order_History


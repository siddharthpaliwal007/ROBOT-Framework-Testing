*** Settings ***
Library           XML
Library           OperatingSystem
Library           Collections
Library           RequestsLibrary

*** Variables ***
${BASE_URL}       http://thomas-bayer.com
${RESOURCE_PATH}  /sqlrest/CUSTOMER/3

*** Test Cases ***
TC_Validate_XML_Response
    [Documentation]    Send a request to retrieve an XML response and validate its structure and content
    [Tags]    xml    response

    # Create a session and send a GET request
    Create Session    mysession    ${BASE_URL}
    ${response}=    Get Request    mysession    ${RESOURCE_PATH}
    Should Be Equal As Numbers    ${response.status_code}    200

    # Parse the XML response
    ${xml_data}=    Parse XML    ${response.content}
    Log    ${xml_data}

    # Check number of elements (e.g., ensure there is one customer element)
    ${customer_elements}=    Get Element    ${xml_data}    //CUSTOMER
    ${num_of_customers}=     Get Element Count    ${customer_elements}    *
    Should Be Equal As Numbers    ${num_of_customers}    1

    # Check the presence of an attribute (if applicable)
    # Assuming 'CUSTOMER' doesn't have an attribute in this case

    # Check value of child elements
    ${customer_id}=         Get Element Text    ${xml_data}    //CUSTOMER/ID
    ${customer_firstname}=  Get Element Text    ${xml_data}    //CUSTOMER/FIRSTNAME
    ${customer_lastname}=   Get Element Text    ${xml_data}    //CUSTOMER/LASTNAME
    ${customer_city}=       Get Element Text    ${xml_data}    //CUSTOMER/CITY

    # Validate the extracted values
    Should Be Equal As Strings    ${customer_id}    3
    Should Be Equal As Strings    ${customer_firstname}    Michael
    Should Be Equal As Strings    ${customer_lastname}    Clancy
    Should Be Equal As Strings    ${customer_city}    Seattle
*** Settings ***
Library           RequestsLibrary
Library           OperatingSystem

*** Variables ***
${BASE_URL}           https://certtransaction.elementexpress.com
${ENDPOINT}           /api/transaction/process
${BEARER_TOKEN}       L6VC7VCDB5Z973MMX3ARP7C4BIV5T2TUEET8SKZOAZG370FD1TAQDJ4FVWO3SP3H
${POSTDATA_FILE}      postdata.txt

*** Test Cases ***
TC_Authenticate_Using_Bearer_Auth
    [Documentation]    Perform a POST request using Bearer Authentication, with data from a file
    [Tags]    auth    bearer

    # Read post data from the file
    ${post_data}=    Get File    ${POSTDATA_FILE}

    # Log the post data for debugging purposes
    Log    ${post_data}

    # Create a session with Bearer Authentication
    Create Session    mysession    ${BASE_URL}    headers=${{"Authorization": "Bearer ${BEARER_TOKEN}", "Content-Type": "application/json"}}

    # Send a POST request
    ${response}=    Post Request    mysession   ${ENDPOINT}    data=${post_data}
    Log    ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}    200

    # Validate the response content
    Log    ${response.content}
    Should Contain    ${response.content}    success


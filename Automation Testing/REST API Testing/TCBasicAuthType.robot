*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}    http://restapi.demoqa.com/authentication/CheckForAuthentication/
${USERNAME}    TestUser
${PASSWORD}    TestPassword

*** Test Cases ***
TC_BasicAuthTest
    [Documentation]    Perform basic authentication using provided credentials and validate the response
    [Tags]    auth    basic

    # Create a session and send a GET request
    Create Session    mysession    ${BASE_URL}    auth=${USERNAME}:${PASSWORD}
    ${response}=    Get Request    mysession
    Log    ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200


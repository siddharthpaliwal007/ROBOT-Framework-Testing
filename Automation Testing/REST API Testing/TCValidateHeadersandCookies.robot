*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com
${RESOURCE_PATH}  /photos

*** Test Cases ***
TC_Validate_Headers_and_Cookies
    [Documentation]    Send a request to JSONPlaceholder and validate response headers and cookies
    [Tags]    headers    cookies

    # Create a session and send a GET request
    Create Session    mysession   ${BASE_URL}
    ${response}=    Get Request    mysession    ${RESOURCE_PATH}
    Should Be Equal As Numbers    ${response.status_code}    200

    # Test Header validations
    ${contentTypeValue}=   get from dictionary  ${response.headers} Content-Type
    should be equal  ${contentTypeValue} application/json; charset=utf-8

    ${contentEncodeValue}=   get from dictionary  ${response.headers} Content-Encoding
    should be equal  ${contentEncodeValue} gzip

    # Test Cookie validations
    ${cookieValue}=  get from dictionary  ${response.cookies} _cfduid
    log to console  ${cookieValue}






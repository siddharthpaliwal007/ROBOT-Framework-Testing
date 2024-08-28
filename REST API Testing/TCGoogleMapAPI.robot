*** Settings ***
Library           RequestsLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BASE_URL}       https://maps.googleapis.com
${REQ_URI}        /maps/api/place/nearbysearch/json
${API_KEY}        YOUR_GOOGLE_MAP_API_KEY
${LOCATION}       40.7607° , 111.8939°
${RADIUS}         700
${TYPE}           restaurant
${KEYWORD}        pizza

*** Test Cases ***
TC_GoogleMapAPI_NearbySearch
    [Documentation]    Perform a GET request to the Google Maps Places API to find nearby places
    [Tags]    googlemaps    places    nearbysearch

    # Construct the query parameters
    ${params}=    Create Dictionary     location=${LOCATION}    radius=${RADIUS}    type=${TYPE}    keyword=${KEYWORD}  key=${API_KEY}
    Log    ${params}

    Create Session    mysession    ${BASE_URL}

    # Send a GET request with query parameters
    ${response}=    Get Request    mysession    ${REQ_URI}    params=${params}
    Log    ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}    200

    # Validate the response content
    Log    ${response.content}
    Should Contain    ${response.content}    "results"

    # Validate specific data such as place in the response
    ${response_json}=    To Json    ${response.content}
    ${place_name}=       get from dictionary    ${response_json}    results[0].name
    Log    ${place_name}
    Should Not Be Empty    ${place_name}
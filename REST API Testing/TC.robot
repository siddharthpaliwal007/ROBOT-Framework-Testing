*** Settings ***
Library     RequestsLibrary
Library     Collections         // If used dictionary

*** Variables ***
${BASE_URL}       http://localhost:8080
${GAME_ID}        1
${GAME_NAME}      Super Mario
${GAME_DATA}      {"id": "${GAME_ID}", "name": "${GAME_NAME}", "releaseDate": "2024-01-01", "reviewScore": 95}

*** Test Cases ***
TC_GET_VideoGame
    [Documentation]    Test GET request to fetch video game details by ID
    [Tags]    get
    Create Session    mysession    ${BASE_URL}
    ${response}=    Get Request    mysession    /videogame/${GAME_ID}

    #Validation
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}
    Should Contain    ${response.json()}    ${GAME_NAME}

TC2_POST_CreateVideoGame
    [Documentation]    Test POST request to create a new video game entry
    [Tags]    post
    Create Session    mysession    ${BASE_URL}
    ${response}=    Post Request    mysession   /videogame    json=${GAME_DATA}

    #Validation
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}

TC3_PUT_UpdateVideoGame
    [Documentation]    Test PUT request to update video game details
    [Tags]    put
    Create Session    mysession    ${BASE_URL}
    ${updated_game_data}=    Set Variable    {"id": "${GAME_ID}", "name": "Super Mario Bros", "releaseDate": "2024-01-01", "reviewScore": 98}
    ${response}=    Put Request    mysession   /videogame/${GAME_ID}    json=${updated_game_data}

    #Validation
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}
    Should Contain    ${response.json()}    Super Mario Bros

TC4_DELETE_VideoGame
    [Documentation]    Test DELETE request to remove a video game entry
    [Tags]    delete
    Create Session    mysession    ${BASE_URL}
    ${response}=    Delete Request   mysession    /videogame/${GAME_ID}

    #Validation
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}

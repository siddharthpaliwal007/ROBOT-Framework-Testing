*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           OperatingSystem

*** Variables ***
${BASE_URL}     http://localhost:8080
${LOCAL_JSON_FILE}  ../VideoGameAPI/data/game_data.json

*** Test Cases ***
TCJSON_Load_Data_From_Local_JSON_File
    [Documentation]    Load data from a local JSON file and use it in API requests
    [Tags]    json    file
    # Load JSON data from the file
    ${json_data}=    Load JSON From File    ${LOCAL_JSON_FILE}
    Log    ${json_data}

    # Extract data from JSON
    ${GAME_ID}=    Set Variable    ${json_data['id']}
    ${EXPECTED_NAME}=    Set Variable    ${json_data['name']}

    # Create session and make a GET request using data from JSON
    Create Session    mysession    ${BASE_URL}
    ${response}=    Get Request    mysession    /videogame/${GAME_ID}
    Should Be Equal As Numbers    ${response.status_code}    200

    # Convert the response content to JSON
    ${response_json}=    Convert String To JSON    ${response.content}
    Log    ${response_json}

    # Validate the response using the data from the JSON file
    Should Contain    ${response_json}    id
    Should Be Equal As Strings    ${response_json['id']}    ${GAME_ID}

    Should Contain    ${response_json}    name
    Should Be Equal As Strings    ${response_json['name']}    ${EXPECTED_NAME}

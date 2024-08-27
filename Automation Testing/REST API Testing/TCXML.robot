*** Settings ***
Library           XML
Library           OperatingSystem
Library           Collections

*** Variables ***
${LOCAL_XML_FILE}  ../data/game_data.xml

*** Test Cases ***
TCXML_Load_Data_And_Perform_XML_Validations
    [Documentation]    Load data from a local XML file and perform various XML validations
    [Tags]    xml    file

    # Load and parse the XML file
    ${xml_data}=    Parse XML    ${LOCAL_XML_FILE}
    Log    ${xml_data}

    # Check number of elements in XML
    ${game_elements}=    Get Element    ${xml_data}    //game
    ${num_of_games}=     Get Element Count    ${game_elements}    *
    Should Be Equal As Numbers    ${num_of_games}    2

    # Check presence of an attribute (if applicable)
    ${id_element}=    Get Element    ${xml_data}    //game[1]/id
    ${id_present}=    Get Element Attribute    ${id_element}    id    1
    Should Be Equal    ${id_present}    1

    # Check value of child elements
    ${game_id}=       Get Element Text    ${xml_data}    //game[1]/id
    ${game_name}=     Get Element Text    ${xml_data}    //game[1]/name
    ${release_date}=  Get Element Text    ${xml_data}    //game[1]/releaseDate
    ${review_score}=  Get Element Text    ${xml_data}    //game[1]/reviewScore

    Should Be Equal As Strings    ${game_id}    1
    Should Be Equal As Strings    ${game_name}    Super Mario
    Should Be Equal As Strings    ${release_date}    2022-07-07
    Should Be Equal As Strings    ${review_score}    75

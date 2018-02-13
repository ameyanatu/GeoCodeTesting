*** Settings ***
Documentation  Used this layer to get external CSV file
Library  ../CustomLib/ReadCSVFileData.py

*** Keywords ***
Get CSV Data
    [Arguments]  ${FILEPATH}
    ${DATA} =  read csv file  ${FILEPATH}
    log  ${DATA}
    [Return]  ${DATA}
Should Contain One Of These Substrings
    [Arguments]    ${value}    @{substrings}
    ${ns}=    Create Dictionary    substrings    ${substrings}    value    ${value}
    ${contains}=    Evaluate    any(substring in value for substring in substrings)    namespace=${ns}
    Run Keyword Unless    ${contains}    Fail    '${value}' does not contain one of: ${substrings}
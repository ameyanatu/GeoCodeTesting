*** Settings ***
Library  Selenium2Library
Library  RequestsLibrary
Resource  ../LocationDataManager.robot
*** Variables ***

*** Keywords ***
Enter location data and send location data and get response and validate
    [Arguments]  ${Locationdata}
    Create Session  my_geocoding_session  https://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Locators/ESRI_Geocode_USA/GeocodeServer/reverseGeocode
    ${response} =  Post Request  my_geocoding_session  ?location=${Locationdata[0]}%2C${Locationdata[1]}
    log  ${response}
    should be equal as strings  ${response.status_code}  200
    ${json} =  set variable  ${response.content}
    LocationDataManager.Should Contain One Of These Substrings  ${json}  ${Locationdata[2]}


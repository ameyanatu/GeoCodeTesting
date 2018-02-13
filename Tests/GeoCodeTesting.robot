*** Settings ***
Documentation  ESRI's GeoCode API Testing
Resource  ../Resources/GeoCodeApp.robot
Resource  ../Resources/CommonWeb.robot
Resource  ../Resources/LocationDataManager.robot
Library  Collections
Test Teardown   End Web Test


#robot -d results -L debug tests/GeoCodeTesting.robot
*** Variables ***
${URL} =  https://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Locators/ESRI_Geocode_USA/GeocodeServer/reverseGeocode
${FILEPATH} =  C:\\Users\\user\\PycharmProjects\\GeoCodeTesting - API\\Data\\LocationData.csv
*** Test Cases ***
Provide Location Data and Verify and Correct Location Through API
    [Documentation]  This Test Case will test Location Input data and validate Reverse Geocoding serivice through API
    ${LISTOFLOCATIONDATA} =  LocationDataManager.Get CSV Data   ${FILEPATH}
    log  ${LISTOFLOCATIONDATA}
    GeoCodeApp.Enter multiple location data and validate result  ${LISTOFLOCATIONDATA}

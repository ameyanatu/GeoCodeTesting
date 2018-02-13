*** Settings ***
Resource  ./PO/Page.robot
Library  Selenium2Library  run_on_failure=Nothing
*** Variables ***
*** Keywords ***
Enter multiple location data and validate result
    [Arguments]  ${LISTOFLOCATIONDATA}
    :FOR  ${Locationdata}  IN  @{LISTOFLOCATIONDATA}
    \  run keyword and continue on failure  Page.Enter location data and send location data and get response and validate  ${Locationdata}



*** Settings ***
Resource    ../Keyword/Keyword.robot
Library    DataDriver    ../TestData/Product_Name.xlsx

Suite Setup    Open Browser    ${url}    ${browser}   
Suite Teardown    Close Browser
Test Template    Fetching Data From InputValues And Sending Into SearchBar 

*** Test Cases ***
TC4 : Verfying If User Able To Search Particular Product By Sending Text To SearchBar.
    Fetching Data From InputValues And Sending Into SearchBar


*** Keywords ***

Fetching Data From InputValues And Sending Into SearchBar
    Wait For Element And Click   ${DissmissPopup}
    [Arguments]    ${ProductName}
    Input Text    ${SearchBar}    ${ProductName}
    Wait For Element And Click    ${SearchButton}
    
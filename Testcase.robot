*** Settings ***
Documentation    Amazon
Resource    ../Keywords/keywords.robot

Suite Setup    Open Browser    ${url}    ${browser}
Suite Teardown    Close Browser

*** Test Cases ***
TC1 : verifying if user able to navigate particular ptroduct
    [Tags]    Searching 
    [Setup]    Log To Console    ${sup}   
    Maximize Browser Window
    Given Searching For Particular Product
    When Selecting The Product
    Then Switch Window    ${Title}
    [Teardown]    Log To Console    ${td}

TC2 : verifying if user able to get particular ptroduct
    [Tags]    Getting 
    [Setup]    Log To Console    ${sup}   
    Given Table Itteration
    Then window handle
    [Teardown]    Log To Console    ${td}
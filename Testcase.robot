
*** Settings ***
Documentation    CoinSwitch Website
Resource    ../Keyword/Key.robot

Suite Setup    Open Browser    ${url}    ${browser}
Suite Teardown    Close Browser

*** Test Cases ***

Tc1 : Verfying If User Able To Navigate To The Particular Website .
    
    [Documentation]    Navigating To The Particular Website And Fetching Bids Value .
    [Tags]    Sanity
    [Setup]    Log To Console    ${StartMessage}

    Given Click On Trade Button 
    And Dismissing PopUp's Present In The Home Page 
    When Fetching And Storing The Particular Value From Bids, Finally Comaparing With Response Content
    Then Fetching And Storing The Particular Value From Asks, Finally Comaparing With Response Content
    [Teardown]    Log To Console    ${EndMessage}
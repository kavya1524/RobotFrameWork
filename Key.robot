*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource    ../Variables/variables.robot

*** Keywords ***
    
Click On Trade Button 
    Maximize Browser Window
    Wait For Element And Click    ${TradeNow_Button}

Dismissing PopUp's Present In The Home Page
    Wait For Element And Click    ${PopUp_ClickOn_SkipAll}
    Wait For Element And Click    ${Done}

Fetching And Storing The Particular Value From Bids , Finally Comaparing With Response Content
    Scroll Element Into View    ${OrderBook}
    Wait For Element And Click    ${OrderBook}
    Scroll Element Into View    ${Limit_Price}
    ${GetValues}    Get Value    ${Limit_Price}
    Log To Console    ${GetValues}

    #Request Session
    Create Session    Session    ${url}
    ${Response}    Get Request    Session    ${Path1}   
    ${Response1}    Evaluate    json.loads('''${Response.content}''')    json
    Log To Console    json_value:\t ${Response1['data']['bids'][0][0]}
    ${Response_Value}    Convert To String    ${Response1['data']['bids'][0][0]}  
    Log To Console    String_value:\t ${Response_Value}

   #Validation
    Should Be Equal    ${Response_Value}    ${GetValues}
    Log To Console    Values Are Matched :\t Bids Matched Values Are :\t ${Response_Value}\t ${GetValues}


Fetching And Storing The Particular Value From Asks , Finally Comaparing With Response Content
    Scroll Element Into View    ${Sell_Price}
    Wait For Element And Click    ${Sell_Price}
    Scroll Element Into View    ${Limit_Price}
    ${GetValues1}    Get Value    ${Limit_Price}
    Log To Console    ${GetValues1}   

    #Request Session
    Create Session    Session    ${url}
    ${Response}    Get Request    Session    ${Path1}   
    ${Response1}    Evaluate    json.loads('''${Response.content}''')    json
    Log To Console    json_value:\t ${Response1['data']['asks'][0][0]}
    ${Response_Value}    Convert To String    ${Response1['data']['asks'][0][0]}
    Log To Console    String_value:\t ${Response_Value}


    #Validation
    Should Be Equal    ${Response_Value}    ${GetValues1}
    Log To Console    Values Are Matched :\t Asks Matched Values Are :\t ${Response_Value}\t ${GetValues1}
Wait For Element And Click
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    timeout=10s
    Click Element    ${element}

Wait For Element Visibility And Input The Text
    [Arguments]    ${element1}    ${element2}
    Wait Until Element Is Visible    ${element1}    timeout=10s
    Input Text    ${element1}    ${element2}   
   
*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource    ../Keyword/Keyword.robot

Suite Setup    Open Browser    ${url}    ${browser}
Suite Teardown    Close Browser

*** Variables ***
${url}    https://coinswitch.co/pro/
${browser}    chrome
${Path1}    /api/v1/realtime-rates/depth?symbol=btc,inr&exchange=wx
${TradeNow_Button}    //*[contains(text(),'TRADE NOW')]
${PopUp_ClickOn_SkipAll}    //*[contains(text(),'Skip All')]
${Done}    //*[contains(text(),'Done')]
${OrderBook}    //*[@class='tw-flex-1 tw-text-left tw-text-gray-400 lg:tw-text-center']
${Limit_Price}    //*[@id='limit_price']

*** Keywords ***
 
coin
    
     Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait For Element And Click    ${TradeNow_Button}
    Wait For Element And Click    ${PopUp_ClickOn_SkipAll}
    Wait For Element And Click    ${Done}
    Scroll Element Into View    ${OrderBook}
    Wait For Element And Click    ${OrderBook}
    Scroll Element Into View    ${Limit_Price}
    ${GetValues}    Get Value    ${Limit_Price}
    Log To Console    ${GetValues}


    Create Session    Session    ${url}
    ${Response}    Get Request    Session    ${Path1}   
    ${Response1}    Evaluate    json.loads('''${Response.content}''')    json
    Log To Console    json_value:\t ${Response1['data']['bids'][16][0]}
    

    FOR    ${BidsResponse}    IN RANGE    0    16    1
         ${Response_Value}    Convert To String    ${Response1['data']['bids'][${BidsResponse}][0]}
         Log To Console    String_value:\t ${Response_Value}
        
        IF    '${Response_Value}' == '${GetValues}'
             Log To Console    Values Are Matched : Values Are :\t ${Response_Value}\t ${GetValues}
        ELSE
             Log To Console    Values Are Not Matched : Values Are :\t ${Response_Value}\t ${GetValues}
        END
        
    END
     
    
   

*** Test Cases ***
tc1
    coin
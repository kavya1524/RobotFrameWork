*** Settings ***  
Library    SeleniumLibrary  

*** Variables ***
${url}    https://coinswitch.co/pro/
${browser}    chrome
${Path1}    api/v1/realtime-rates/depth?symbol=btc,inr&exchange=csx


## CoinSwithch Xpath ###

# Trade Buttton Xpath #
${TradeNow_Button}    //*[contains(text(),'TRADE NOW')]

# Home Page Content Xpaths
${PopUp_ClickOn_SkipAll}    //*[contains(text(),'Skip All')]
${Done}    //*[contains(text(),'Done')]
${OrderBook}    //*[@class='tw-p tw-relative tw-mb-[1px] tw-flex tw-w-full tw-cursor-pointer tw-border-gray-800 tw-text-xxs lg:tw-border-r lg:tw-p-1 lg:tw-text-xs']
${Limit_Price}    //*[@id='limit_price']
${Sell_Price}    xpath:(//*[@class='tw-flex-1 tw-text-left tw-text-gray-400 lg:tw-text-center'])[11]


## Setup and Teardown Message ##

# TC1
${StartMessage}    Navigating To The Particular Website And Dismissing Pop-up.
${EndMessage}    Successfully Compared The Values.

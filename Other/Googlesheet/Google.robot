*** Settings ***
Library    RPA.Cloud.Google
Library    ExcelLibrary
Library    String
Library    SeleniumLibrary


Suite Setup     Init Sheets    Keys.json

Resource    ../Keyword/Keyword.robot

*** Variables ***
${SHEET_ID}         1spW2i71VhNdIkUp-BBcRTl9tlRXg0U795KdHDnWM2c4
${SHEET_RANGE}      Sheet1!A2:A3


*** Test Cases ***
rrr
    Open Browser    ${url}    ${browser}
    Dismissing The Login Pop-up In The Home Page
    Read values from the Google Sheet


*** Keywords ***
Read values from the Google Sheet

    
    ${spreadsheet_content}=    Get Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}
    Clear Element Text    ${SearchBar}
    Input Text    ${SearchBar}    ${spreadsheet_content}
    Sleep    3
    Wait For Element And Click    ${SearchButton}
    Log To Console    ${spreadsheet_content}
    
    
    
    # IF    "values" in ${spreadsheet_content}
    #     FOR    ${s}    IN RANGE    0    3    1
            
    #          ${a}    Convert To String    ${spreadsheet_content["values"][${s}]}
    #          ${c}    Remove String    ${a}    [    ]    "    "
    #          Clear Element Text    ${SearchBar}
    #          Input Text    ${SearchBar}    ${c}
    #          Sleep    3
    #          Wait For Element And Click    ${SearchButton}
    #         Log To Console    ${c}
    #     END
        

    # END

    


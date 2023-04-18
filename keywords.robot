*** Settings ***
Resource    ../Variables/variables.robot

*** Keywords ***

Searching For Particular Product 
    Wait For Element Visibility And Input The Text    ${Search_box}    ${Prouct_Name}
    Wait For Element And Click    ${Search_button}
    
Selecting The Product
    Wait Until Element Is Visible    ${click_P}
    Scroll Element Into View    ${click_P}
    Wait For Element And Click    ${click_P}

Scroll down to find table
    Wait Until Element Is Visible    ${scroll}
    Scroll Element Into View    ${scroll}
    Wait Until Element Is Visible    ${scroll}

Table Itteration

    ${Row_count}    Get Element Count    ${row_count}
    ${Coloumn_count}    Get Element Count    ${coloum_count}
    Log To Console    ${Row_count}
    Log To Console    ${Coloumn_count}

    FOR    ${Row_index}    IN RANGE    1    ${Row_count} + 1    1 
         ${Row_data}    Get Text    xpath://table[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[${Row_index}]//td
         Run Keyword If    '${Row_data}' == '${Title}'    Exit For Loop
    END
    Log To Console    ${Row_index}
    FOR    ${Coloum_Index}    IN RANGE    1    ${Coloumn_count} + 1    1
         ${Coloum_data2}    Get Text    xpath://table[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[${Row_index}]//td[${Coloum_Index}]        
        IF    '${Coloum_data2}' == '${Expexted}'
             ${Coloum_data3}    Get Text    xpath://table[@class='a-bordered a-horizontal-stripes a-spacing-micro a-size-small ucc-comparison-table']//tr[${Row_index}]//td[3]         
            Log To Console    ${Coloum_Index}
            Log To Console    ${Coloum_data2}
            Log To Console    ${Coloum_data3}
        ELSE
            Log To Console    ${Coloum_data2}
            
        END
        Run Keyword If    '${Coloum_data2}' == '${Expexted}'    Exit For Loop
    
    END
    
window handle
    ${window}    Get Window Handles
    Switch Window    ${window}[0]

Wait For Element Visibility And Input The Text
    [Arguments]    ${element1}    ${element2}
    Wait Until Element Is Visible    ${element1}    timeout=10s
    Input Text    ${element1}    ${element2}

Wait For Element And Click
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    timeout=10s
    Click Element    ${element}
*** Settings ***
Library    SeleniumLibrary
Variables    D:/Robo_Frame_Projects/robo_test1/Pages/Practo_Homepage.py
Variables   D:/Robo_Frame_Projects/robo_test1/Pages/config.py
Library    ExcelLibrary


*** Keywords ***
launch practo website
    open browser    ${url}  ${browser}  options=add_argument("--window-size=1920,1080")
    maximize browser window
    ${title}    get title
    log to console    ${title}


close practo website
    close all browsers

click once visible
    [Arguments]    ${locator}
    wait until element is visible   ${locator}  40
    click element    ${locator}

enter text once visible
    [Arguments]    ${locator}   ${message}
    wait until element is visible    ${locator} 40
    input text    ${locator}    ${message}

Read values from excel
    [Arguments]    ${row_num}   ${col_num}
    Open Excel Document     D:/Robo_Frame_Projects/robo_test1/Tests.xlsx   my_excel
    ${cell_value}=     Read Excel Cell     ${row_num}   ${col_num}
    log to console    ${cell_value}
    close current excel document
    RETURN    ${cell_value}






perform sanity on practo homepage
    click once visible    ${practo_home_logo}
    click once visible    ${find_doctors_ban}
    click once visible    ${video_consult_ban}
    click once visible    ${surgeries_ban}
    page should contain element    ${login_btn}
    click once visible    ${corporate_ban}
    click once visible    ${provider_ban}
    click once visible    ${security_ban}
    click once visible    ${practo_home_logo}
    click once visible    ${doc_search_txt_box}
    click once visible    ${location_box}

validate the location list
    click once visible    ${location_box}
    element should be visible    ${loc_suggestion_list}
    @{element_list}     get webelements    ${loc_suggestion_list}
    FOR    ${element}   IN    @{element_list}
        ${element_text}=    get text    ${element}
        log to console    ${element_text}
    END
    click once visible    ${location_box}
    element should be visible    ${loc_suggestion_group}
    @{group_list}     get webelements    ${loc_suggestion_list}
    FOR    ${element}   IN    @{group_list}
        ${group_list_text}=    get text    ${element}
        log to console    ${group_list_text}
    END



Perform location check
    #click once visible    ${location_box}
    #clear element text    ${location_box}
    ${city}=    Read values from excel  2       1
    input text    ${location_box}      ${city}   True
    sleep    5s
    ${city}=    Read values from excel  3      1
    input text    ${location_box}      ${city}   True
    sleep    5s
    ${city}=    Read values from excel  4      1
    input text    ${location_box}      ${city}   True
    sleep    5s

Click on healthinsurance plan
    click once visible    ${corporate_ban}
    click once visible    ${health_ins_ban}

Click on groupinsurance plan
    click once visible    ${corporate_ban}
    click once visible    ${group_ins_ban}



perform login checks
    click once visible    ${login_btn}
    sleep    40s
    go to    https://accounts.practo.com/login?next=%2Fcheckid_request&intent=fabric
    enter text once visible     ${login_txt_box}    test@test.com
    enter text once visible    ${pwd_txt_box}       12345
    click once visible    ${submit_login_btn}

*** Keywords ***
Open browser and go to login page
    Open Browser    ${URL}    ${BROWSER}
    SeleniumLibrary.Set Window Size    ${WINDOWS_WIDTH}    ${WINDOWS_HEIGHT}
    Set Selenium Speed    ${DELAY}

Click element
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    SeleniumLibrary.Click Element    ${locator}

Input text
    [Arguments]    ${locator}    ${text}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    SeleniumLibrary.Click Element    ${locator}
    SeleniumLibrary.Input Text    ${locator}    ${text}    clear=True

Wait until loading disappear
    SeleniumLibrary.Wait Until Page Does Not Contain Element    ${dict_common}[loading]    timeout=${GLOBAL_TIMEOUT}

Format Text
    [Arguments]    ${format_string}    &{key_value_pairs}
    ${key_value_pairs}=     Collections.Convert To Dictionary    ${key_value_pairs}
    ${result_text}    Evaluate    unicode($format_string).format(**$key_value_pairs) if sys.version_info.major==2 else str($format_string).format(**$key_value_pairs)    modules=sys
    [Return]    ${result_text}

Generate random string
    [Arguments]    ${length}=8    ${chars}=[LETTERS][NUMBERS]
    ${gen_string}=    String.Generate Random String    ${length}    ${chars}
    [Return]    ${gen_string}

Get Valid File Name
    [Arguments]    ${fname}
    ${valid_fname}     Evaluate    base64.urlsafe_b64encode($fname.decode('ascii')) if sys.version_info.major==2 else base64.urlsafe_b64encode($fname.encode('UTF-8'))    modules=sys,base64
    [Return]    ${valid_fname}

Test Teardown
    ${sc_fname}=    common_keywords.Get Valid File Name     ${TEST_NAME}
    ${status}    ${screenshot_path}    Run Keyword And Ignore Error    SeleniumLibrary.Capture Page Screenshot    ${sc_fname}_{index}.png
    Set Suite Variable    ${${TEST_NAME}}    ${screenshot_path}
    Run Keyword If Test Failed    Run Keyword And Ignore Error    SeleniumLibrary.Log Source

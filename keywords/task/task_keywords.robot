*** Keywords ***
Click add task button
    common_keywords.Click element    ${dict_task}[btn_add_task]

Input relate property
    [Arguments]    ${relate_property_name}    ${relate_property_address}
    ${relate_property}=    Set Variable    ${relate_property_name}, ${relate_property_address}
    common_keywords.Click element    ${dict_task}[lbl_search_relate]
    common_keywords.Input text    ${dict_task}[inp_ddl_search]    ${relate_property}
    ${locator}=    Format Text    ${dict_task}[sel_result_label]    expected_result=${relate_property}
    common_keywords.Click element    ${locator}

Input task description
    [Arguments]    ${task_desc}
    common_keywords.Input text    ${dict_task}[txt_description]    ${task_desc}

Click save task button
    common_keywords.Click element    ${dict_task}[inp_save_task]

Verify task relate property is created
    [Arguments]    ${relate_property_name}
    SeleniumLibrary.Wait Until Element Contains    ${dict_task}[lbl_relate_property]    ${relate_property_name}

Search task
    [Arguments]    ${task}
    common_keywords.Input text    ${dict_task}[inp_search_task]    ${task}
    common_keywords.Click element    ${dict_task}[btn_search_task]
    common_keywords.Wait until loading disappear
    SeleniumLibrary.Wait Until Element Contains    ${dict_task}[table_result_tasks]    ${task}    timeout=${GLOBAL_TIMEOUT}
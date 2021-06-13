*** Keywords ***
Click add properties
    common_keywords.Click element    ${dict_property}[btn_add_properties]

Click multiple unit
    common_keywords.Click element    ${dict_property}[lbl_multiple_unit]

Input property name
    [Arguments]    ${property_name}
    common_keywords.Input text    ${dict_property}[inp_property_name]    ${property_name}

Input property owner
    [Arguments]    ${property_owner}
    common_keywords.Click element    ${dict_property}[ddl_property_owner]
    ${property_owner_result}=    common_keywords.Format Text    ${dict_property}[sel_result_label]    expected_result=${property_owner}
    common_keywords.Click element    ${property_owner_result}

Input property address
    [Arguments]    ${property_address}
    common_keywords.Input text    ${dict_property}[inp_property_address]    ${property_address}

Select checkbok manage property
    SeleniumLibrary.Select Checkbox    ${dict_property}[chk_manage_property]

Input property unit
    [Arguments]    ${property_unit}=2
    common_keywords.Input text    ${dict_property}[inp_property_unit]    ${property_unit}

Click next unit setting
    common_keywords.Click element    ${dict_property}[inp_btn_next_page]

Select unit type
    Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Page Does Not Contain    Loading...    timeout=10
    common_keywords.Click element    ${dict_property}[sel_unit_type]
    SeleniumLibrary.Select From List By Index    ${dict_property}[sel_unit_type]    2

Input unit manager
    [Arguments]    ${unit_manager}
    common_keywords.Click element    ${dict_property}[inp_unit_manager]
    ${result_unit_manager}=    common_keywords.Format Text    ${dict_property}[sel_result_label]    expected_result=${unit_manager}
    common_keywords.Click element    ${result_unit_manager}

Input unit agent
    [Arguments]    ${unit_agent}
    common_keywords.Click element    ${dict_property}[inp_unit_agent]
    ${result_unit_agent}=    common_keywords.Format Text    ${dict_property}[sel_result_label]    expected_result=${unit_agent}
    common_keywords.Click element    ${result_unit_agent}

Input multiple unit owner
    ${count}=    SeleniumLibrary.Get Element Count    ${dict_property}[table_multiple_unit]
    FOR    ${i}    IN RANGE    ${count}
        ${locator}=    common_keywords.Format Text    ${dict_property}[sel_multi_unit]    position=${i+1}
        SeleniumLibrary.Select From List By Index    ${locator}    1
    END

Click submit add property
    common_keywords.Click element    ${dict_property}[inp_btn_add_property]
    common_keywords.Wait until loading disappear
    SeleniumLibrary.Wait Until Page Contains    ${translation_common}[multi_unit_added]
    SeleniumLibrary.Wait Until Page Contains    ${dict_message}[property_added]    timeout=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait Until Page Does Not Contain    ${dict_message}[property_added]    timeout=${GLOBAL_TIMEOUT}

Search property
    [Arguments]    ${property}
    common_keywords.Input text    ${dict_property}[inp_search_property]    ${property}
    common_keywords.Click element    ${dict_property}[btn_search_property]
    common_keywords.Wait until loading disappear
    SeleniumLibrary.Wait Until Element Contains    ${dict_property}[table_result_properties]    ${property}    timeout=${GLOBAL_TIMEOUT}
*** Keywords ***
Verify login success
    SeleniumLibrary.Wait Until Page Contains Element    ${dict_dashboard}[account_name]    timeout=${GLOBAL_TIMEOUT}

Click account name
    common_keywords.Click element    ${dict_dashboard}[account_name]

Click dropdown profile
    common_keywords.Click element    ${dict_dashboard}[btn_dropdown_profile]

Click sign out button
    common_keywords.Click element    ${dict_dashboard}[btn_logout]

Click label 'properties'
    common_keywords.Click element    ${dict_dashboard}[lbl_properties]
    common_keywords.Wait until loading disappear

Click label 'task'
    common_keywords.Click element    ${dict_dashboard}[lbl_tasks]
    common_keywords.Wait until loading disappear

Click sign out and sigh out success
    dashboard_keywords.Click account name
    dashboard_keywords.Click dropdown profile
    dashboard_keywords.Click sign out button
    login_keywords.Verify lockdown page is visible
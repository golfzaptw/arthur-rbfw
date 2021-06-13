*** Keywords ***
Input username
    [Arguments]    ${username}
    common_keywords.Input text    ${dict_login}[inp_username]    ${username}

Input password
    [Arguments]    ${password}
    SeleniumLibrary.Wait Until Element Is Visible    ${dict_login}[inp_password]    timeout=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Input Password    ${dict_login}[inp_password]    ${password}

Click button login
    SeleniumLibrary.Click Button    ${dict_login}[btn_submit]

Input username, password and click login
    [Arguments]    ${username}    ${password}
    login_keywords.Input username    ${username}
    login_keywords.Input password    ${password}
    login_keywords.Click button login

Verify lockdown page is visible
    SeleniumLibrary.Wait Until Page Contains Element    ${dict_lockdown}[inp_access_password]    timeout=${GLOBAL_TIMEOUT}
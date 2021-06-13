*** Settings ***
Resource            ${CURDIR}/../resources/import.robot

Test Setup          common_keywords.Open browser and go to login page
Test Teardown       Run Keywords    common_keywords.Test Teardown    AND    SeleniumLibrary.Close All Browsers

*** Variables ***
${property_owner}    Owner 1 - Sansiri
${full_name_manager}    ${user_test}[first_name] ${user_test}[last_name]
${unit_type}    Flat
${agent}    Real Agency

*** Keywords ***
Scenario 1: Login to system
    login_keywords.Input username, password and click login    ${user_test}[email]    ${user_test}[password]
    dashboard_keywords.Verify login success

Scenario 2: Add a property with a multiple rentable units
    [Arguments]    ${property_name}    ${property_address}
    dashboard_keywords.Click label 'properties'
    property_keywords.Click add properties
    property_keywords.Click multiple unit
    property_keywords.Input property name    ${property_name}
    property_keywords.Input property owner    ${property_owner}
    property_keywords.Input property address    ${property_address}
    property_keywords.Select checkbok manage property
    property_keywords.Input property unit
    property_keywords.Click next unit setting
    property_keywords.Select unit type
    property_keywords.Input unit manager    ${full_name_manager}
    property_keywords.Input unit agent    ${agent}
    property_keywords.Input multiple unit owner
    property_keywords.Click submit add property
    dashboard_keywords.Click label 'properties'
    property_keywords.Search property    ${property_name}

Scenario 3: Add a task related to above property
    [Arguments]    ${property_name}    ${property_address}    ${task_desc}
    dashboard_keywords.Click label 'task'
    task_keywords.Click add task button
    task_keywords.Input relate property    ${property_name}    ${property_address}
    task_keywords.Input task description    ${task_desc}
    task_keywords.Click save task button
    task_keywords.Verify task relate property is created    ${property_name}
    dashboard_keywords.Click label 'task'
    task_keywords.Search task    ${task_desc}

Scenario 4: Logout of system
    dashboard_keywords.Click sign out and sigh out success

*** Test Cases ***
Arthur
    [Tags]    t-2
    ${gen_property_name}=    common_keywords.Generate random string
    ${gen_property_address}=    common_keywords.Generate random string
    ${gen_task_desc}=    common_keywords.Generate random string
    Scenario 1: Login to system
    Scenario 2: Add a property with a multiple rentable units    ${gen_property_name}    ${gen_property_address}
    Scenario 3: Add a task related to above property    ${gen_property_name}    ${gen_property_address}    ${gen_task_desc}
    Scenario 4: Logout of system
*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         String
Library         DebugLibrary

Resource        ${CURDIR}/../keywords/common_keywords.robot
Resource        ${CURDIR}/../keywords/common_locators.robot
Resource        ${CURDIR}/../keywords/login/login_pages.robot
Resource        ${CURDIR}/../keywords/login/login_keywords.robot
Resource        ${CURDIR}/../keywords/dashboard/dashboard_pages.robot
Resource        ${CURDIR}/../keywords/dashboard/dashboard_keywords.robot
Resource        ${CURDIR}/../keywords/property/property_pages.robot
Resource        ${CURDIR}/../keywords/property/property_keywords.robot
Resource        ${CURDIR}/../keywords/task/task_pages.robot
Resource        ${CURDIR}/../keywords/task/task_keywords.robot

Variables       ${CURDIR}/config.yaml
Variables       ${CURDIR}/translation.yaml
Variables       ${CURDIR}/test_data.yaml
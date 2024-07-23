*** Settings ***
Documentation    Page Object to contain generic Keywords used by different tests.
Library    SeleniumLibrary
Library    Collections
Resource    login_data.robot

*** Variables ***
${root_url}    https://formy-project.herokuapp.com/form
${target_browser}    Chrome


*** Keywords ***
Start Session
    Log    Test ran on ${target_browser}.
    Open Browser    ${root_url}    ${target_browser}

Close Session
    # Will run at the end of the test suite to ensure that cookies won't affect results of 
    # further tests.
    Delete All Cookies
    Close Browser

Check if Confirmation is Visible in the Page and Message is Correct
    [Arguments]    ${element}    ${message}
    Wait Until Element Is Visible    ${element}    timeout=5

    # check with message is corerct
    ${text}=    Get Text    ${element}
    Should Be Equal As Strings    ${message}    ${text}

Check if Element is Loaded
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
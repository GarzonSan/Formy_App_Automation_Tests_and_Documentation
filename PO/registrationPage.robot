*** Settings ***
Documentation    Contains all keywords and routines that aim to verify the form functional
...              requirements.
Library    SeleniumLibrary
Library    Collections
Library    ../Custom Libraries/Generics.py
Library    ../venv/Lib/site-packages/robot/libraries/Screenshot.py
Library    ../venv/Lib/site-packages/robot/libraries/XML.py
Resource    generic.robot

*** Variables ***
${submit_button}    xpath://div[@class='form-group']/div/a[@role='button']

${alert_message_element}    xpath://div[@role='alert']
${success_alert_msg}    The form was successfully submitted!
${failed_alert_msg}    The form could not be submitted :\

${form_name_field}    id:first-name
${form_sname_field}    id:last-name
${form_job_field}    id:job-title
${form_radial_field}    xpath://div[@class='input-group']
${form_checkbox_field}    xpath://div[@class='input-group']
${form_experience_field}    id:select-menu
${form_date_field}    id:datepicker

# data for verification
@{experience_field_expected_data}    Select an option    0-1    2-4    5-9    10+
${check_boxes_amount}    3
${radio_amount}    3

*** Keywords ***
Fill Registration Form
    [Arguments]    ${name}    ${sname}    ${job_title}    ${current_date}    ${should_fail}=False
    
    # Check if arguments should be valid or not
    IF    ${should_fail}
        Log    As should fail, its not validating data before input.
    ELSE
        Is Data Valid For Field    Text    ${name}
        Is Data Valid For Field    Text    ${sname}
        Is Data Valid For Field    Text    ${job_title}
        Is Data Valid For Field    Date   ${current_date}
    END
    
    # Input data
    Input Text    ${form_name_field}    ${name}
    Input Text    ${form_sname_field}    ${sname}
    Input Text    ${form_job_field}    ${job_title}

    # complementing element xpath string
    ${radio}=    Catenate    SEPARATOR=    ${form_radial_field}    [1]/div/input[@id='radio-button-1']
    ${check}=    Catenate    SEPARATOR=    ${form_checkbox_field}    [2]/div/input[@id='checkbox-1']

    Click Element    ${radio}
    Select Checkbox    ${check}

    Select From List By Value    ${form_experience_field}    2
    Capture Page Screenshot    filename=correctly-filled-data-{index}.png
    Input Text    ${form_date_field}    ${current_date}

Submit Form
    Click Element    ${submit_button}

Check Confirmation
    [Arguments]    ${msg}
    Check if Confirmation is Visible in the Page and Message is Correct    ${alert_message_element}    ${msg}

Check if Options Matches Expected
    @{menu_options}=    Get List Items    ${form_experience_field}
    @{test_list}=    Create List

    ${index}=    Set Variable    1

    FOR    ${element}    IN    @{menu_options}
        Append To List    ${test_list}    ${element} 
    END

    Lists Should Be Equal    ${menu_options}    ${test_list}

Checkbox Field Works As Expected
    [Arguments]    ${element}
    @{selected_list}=    Create List

    FOR    ${counter}    IN RANGE    1    ${check_boxes_amount} + 1
        ${check}=    Catenate    SEPARATOR=    ${form_checkbox_field}    [2]/div/input[@id='checkbox-${counter}']
        Select Checkbox    ${check}
        Sleep    0.2
        Checkbox Should Be Selected    ${check}
        ${text}=    Get Text    ${check}

        Append To List    ${selected_list}    ${check}
    END

    Length Should Be    ${selected_list}    ${check_boxes_amount}

Radio Selectors Works As Expected
    [Arguments]    ${element}
    @{selected_list}=    Create List

    FOR    ${counter}    IN RANGE    1    ${radio_amount} + 1
        ${radio}=    Catenate    SEPARATOR=    ${form_radial_field}    [1]/div/input[@id='radio-button-${counter}']
        Click Element    ${radio}
        Sleep    0.2
        Select Radio Button    Radio button    radio-button-${counter}
        ${text}=    Get Text    ${radio}

        Append To List    ${selected_list}    ${radio}
    END

    Length Should Be    ${selected_list}    ${check_boxes_amount}



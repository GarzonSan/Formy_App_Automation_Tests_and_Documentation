*** Settings ***
Documentation    The test cases in this script focus in testing the app functional requirements
...              and issues that might be found by misinterpretation of those.
Library    SeleniumLibrary
Library    Collections
Resource    ../PO/generic.robot
Resource    ../PO/registrationPage.robot
Resource    ../PO/login_data.robot
Test Setup    Start Session
Test Teardown    Close Session


*** Test Cases ***
User Fills Data Correctly and Submits the Form
    registrationPage.Fill Registration Form    ${valid_name}    ${valid_sname}    ${valid_job_title}    ${valid_date}
    registrationPage.Submit Form
    registrationPage.Check Confirmation    ${success_alert_msg}

Dropdown Field is Displaying Intended Content
    generic.Check if Element is Loaded    ${form_experience_field}
    registrationPage.Check if Options Matches Expected

User Fills Incorrect Or Invalid Data and Submits the Form
    registrationPage.Fill Registration Form    ${invalid_name}    ${invalid_sname}    ${invalid_job_title}    ${invalid_date}    True
    registrationPage.Submit Form
    registrationPage.Check Confirmation    ${failed_alert_msg}

User Try To Submit The Form Without Any Information
    # Succeeds if the submission fails
    registrationPage.Submit Form
    registrationPage.Check Confirmation    ${failed_alert_msg}

User Try To Submit The Form Without Some Information
    # Leaves some fields blank especting that it will fail
    registrationPage.Fill Registration Form    ${valid_name}    ${EMPTY}    ${valid_job_title}    ${EMPTY}
    registrationPage.Submit Form
    registrationPage.Check Confirmation    ${failed_alert_msg}

Multiple Options Fields Works as Expected
    # test if those fields are working as expected and doesn't affect user experience.
    registrationPage.Checkbox Field Works As Expected    ${form_checkbox_field}
    registrationPage.Radio Selectors Works As Expected    ${form_radial_field}

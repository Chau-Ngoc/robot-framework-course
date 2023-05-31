*** Settings ***
Documentation       To validate the login form

Resource            resources/resources.resource
Library             SeleniumLibrary
Library             Collections

Test Setup          Open Browser    browser=edge
Test Teardown       Close Browser


*** Test Cases ***
Validate error message when login
    Go to ${demo_url}
    Fill the login form    username    ${username}    password    ${incorrect_password}
    Click "Sign In" Button
    Wait until element with selector "css:.alert.alert-danger" is visible
    "${error_message}" should be shown on the page

Cards should display after successful login
    Go To ${demo_url}
    Fill the login form    username    ${username}    password    ${correct_password}
    Click "Sign In" button
    Wait until element with selector "css:.row h1" is visible
    "Shop Name" should be shown on the page
    @{cards_list} =    get webelements    css:.card-title
    @{actual_phones_list} =    create list
    FOR    ${phone}    IN    @{cards_list}
        Append To List    ${actual_phones_list}    ${phone.text}
    END
    Lists should be equal    ${expected_phones_list}    ${actual_phones_list}


*** Keywords ***
Go to ${url}
    Go To    ${url}

Fill the login form
    [Arguments]    ${email_locator}    ${email}    ${password_locator}    ${password}
    Input Text    ${email_locator}    ${email}
    Input Password    ${password_locator}    ${password}

Click "${text}" button
    Click Button    ${text}

Wait until element with selector "${class_name}" is visible
    Wait Until Element Is Visible    ${class_name}

"${text}" should be shown on the page
    Page Should Contain    ${text}

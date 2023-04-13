*** Settings ***
Documentation       To validate the login form

Library             SeleniumLibrary


*** Test Cases ***
Validate error message when login to Facebook
    Open edge browser and go to Facebook
    Fill in the login form
    Click Login button
    Verify error message is correct


*** Keywords ***
Open edge browser and go to Facebook
    Open Browser    browser=edge
    Go To    https://www.facebook.com/

Fill in the login form
    Input Text    email    lengocchau16@yahoo.com
    Input Password    pass    thisistheWrongPassword123

Click Login button
    Click Button    login
    Wait Until Page Contains    The password that you've entered is incorrect.

Verify error message is correct
    Page Should Contain    The password that you've entered is incorrect.

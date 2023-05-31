*** Settings ***
Documentation       A resource file with reusable keywords and variables

Library             SeleniumLibrary


*** Variables ***
${demo_url}                 https://rahulshettyacademy.com/loginpagePractise/
${username}                 rahulshettyacademy
${correct_password}         learning
${incorrect_password}       thisistheWrongPassword123
${error_message}            Incorrect username/password.

@{expected_phones_list}     iphone X    Samsung Note 8    Nokia Edge    Blackberry

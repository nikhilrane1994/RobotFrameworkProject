*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Sample Test Case
    [documentation]  Google tabs
    [tags]  Regression

    Open Browser    https://www.saucedemo.com    chrome
    Input Text    xpath=//input[@placeholder='Username']    standard_user1
    Input Text    xpath=//input[@placeholder='Password']    secret_sauce
    Click Element    xpath=//input[@type='submit']
    ${exp_error}    Get Text    xpath=//h3[@data-test='error']
    Log To Console    ${exp_error}
    ${contains_bool}=    Run Keyword And Return Status    Should Contain    ${exp_error}    Username and password do not match
    Log To Console    ${contains_bool}
    Should Be True    ${contains_bool}
#    Click Element    xpath=//*[text()='Sauce Labs Backpack']//following::button[1]
#    Click Element    xpath=//*[@class='shopping_cart_link']
#    Click Element    id=checkout
#    Input Text    name=firstName    nik
#    Input Text    name=lastName    stan
#    Input Text    name=postalCode    411077
#    Click Element    xpath=//input[@type='submit']
#    Click Element    id=finish

*** Keywords ***
Login to Application

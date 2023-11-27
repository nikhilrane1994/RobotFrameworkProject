*** Settings ***
Resource    ../Locators/LoginPageLocators.robot
Resource    CommonPo.robot

*** Variables ***
${UserName}            standard_user
${Password}            secret_sauce
${Product_title}       Products


*** Keywords ***
Login To Application
    [Documentation]
	...  Login using valid username and password  ...

    Open Browser SwagLabs
    Submit Login    ${username}    ${password}
    Element Text Should Be    ${loginTitle}    ${Product_title}


Submit Login
    [Arguments]    ${username}    ${password}
    [Documentation]
	...  Login using the username and password  ...

    Input Text    ${usernameText}    ${username}
    Input Text    ${passwordText}    ${password}
    Click Element    xpath=//input[@type='submit']


Error Message for Invalid Login
    [Arguments]    ${act_error}
    [Documentation]
	...  Error message for invalid login  ...

	${exp_error}    Get Text    ${errorText}
    Log To Console    ${exp_error}
    ${contains_bool}=    Run Keyword And Return Status    Should Contain    ${exp_error}    ${act_error}
    Log To Console    ${contains_bool}
    Should Be True    ${contains_bool}


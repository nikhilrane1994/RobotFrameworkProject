*** Settings ***
Resource   ../PageObjects/LoginPage.robot
Resource   ../PageObjects/CommonPage.robot

Documentation   This suite includes login tests

Test Teardown    Close Browser

*** Variables ***
${UserName}                  standard_user
${Password}                  secret_sauce
${invalidUserName}           abcd
${invalidPassword}           inv@123
${UserName_num}              1234
${Password_num}              1234
${UserName_alphanum}         abc@1234
${empty_user}
${empty_pass}
${WRONG_PASSWORD_USERNAME_ERR}       Username and password do not match
${EMPTY_PASS_ERR}                    Password is required
${EMPTY_USR_ERR}                     Username is required

*** Test Cases ***
Verify Valid Login
    [Documentation]    Verify that login to the application is working with correct user and pass

    Login To Application
    Logout From The Application


Verify login with invalid username and password
    [Documentation]    Verify that user cannot login with invalid username and password

    Open Browser SwagLabs
    Submit Login    ${invalidUserName}    ${invalidPassword}
    Error Message for Invalid Login    ${WRONG_PASSWORD_USERNAME_ERR}


Verify login with invalid username
    [Documentation]    Verify that user cannot login with invalid username

    Open Browser SwagLabs
    Submit Login    ${invalidUserName}    ${Password}
    Error Message for Invalid Login    ${WRONG_PASSWORD_USERNAME_ERR}


Verify login with invalid password
    [Documentation]    Verify that user cannot login with invalid password

    Open Browser SwagLabs
    Submit Login    ${UserName}    ${invalidPassword}
    Error Message for Invalid Login    ${WRONG_PASSWORD_USERNAME_ERR}


Verify login with Empty Username and Password
    [Documentation]    Verify that user cannot login with empty username and password

    Open Browser SwagLabs
    Submit Login    ${empty_user}     ${empty_pass}
    Error Message for Invalid Login    ${EMPTY_USR_ERR}


Verify login with Empty Username
    [Documentation]    Verify that user cannot login with empty username

    Open Browser SwagLabs
    Submit Login    ${empty_user}    ${Password}
    Error Message for Invalid Login    ${EMPTY_USR_ERR}


Verify login with Empty Password
    [Documentation]    Verify that user cannot login with empty password

    Open Browser SwagLabs
    Submit Login    ${UserName}    ${empty_pass}
    Error Message for Invalid Login    ${EMPTY_PASS_ERR}


Verify login with numbers as username
    [Documentation]    Verify that user cannot login with numbers as username

    Open Browser SwagLabs
    Submit Login    ${UserName_num}    ${Password}
    Error Message for Invalid Login    ${WRONG_PASSWORD_USERNAME_ERR}


Verify login with numbers as password
    [Documentation]    Verify that user cannot login with numbers as password

    Open Browser SwagLabs
    Submit Login    ${UserName}    ${Password_num}
    Error Message for Invalid Login    ${WRONG_PASSWORD_USERNAME_ERR}


Verify login with alphanumeric username
    [Documentation]    Verify that user cannot login with alphanumeric username

    Open Browser SwagLabs
    Submit Login    ${UserName_alphanum}    ${Password}
    Error Message for Invalid Login    ${WRONG_PASSWORD_USERNAME_ERR}
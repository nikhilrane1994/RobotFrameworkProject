*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
${ENV_URL}     https://www.saucedemo.com
${BROWSER}     chrome

*** Keywords ***
Open Browser SwagLabs
    [Documentation]
	...  Open the browser and navigates to the login page  ...

    Open Browser      ${ENV_URL}   ${BROWSER}
    Maximize Browser Window


Logout From The Application
    [Documentation]
	...  Logout from the application  ...

	Click Element    xpath=//*[text()='Open Menu']
	Click Element    xpath=//*[text()='Logout']
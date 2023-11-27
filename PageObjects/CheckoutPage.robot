*** Settings ***
Resource    ../Locators/LoginPageLocators.robot
Resource    CommonPo.robot
Library    String

*** Variables ***
${UserName}            standard_user
${Password}            secret_sauce
${Checkout_title}      Checkout: Your Information
${quantity}            QTY
${Description}         Description
${Product_title}       Products
${Cart_title}          Your Cart
${Overview_title}      Checkout: Overview


*** Keywords ***
Checkout Icon Presence
    [Documentation]
	...  Verify if checkout is ppresent or not  ...

    ${Status}=     Run Keyword And Return Status     Element Should Be Visible    id=checkout
    Should Be True    ${Status}

Checkout Icon Clickable
    [Documentation]
	...  Verify if checkout is clickable  ...

	Click Element    id=checkout
	Element Text Should Be    xpath=//span[@class='title']    ${Checkout_title}

Cancel Option Present and Clickable
    [Documentation]
	...  Verify if cancel is present or not on checkout  ...
	${Status}=     Run Keyword And Return Status     Element Should Be Visible    id=cancel
    Should Be True    ${Status}
    Click Element    id=cancel

Cancel The Transaction
    [Documentation]
	...  Verify if Transaction Cancel From Checkout Page  ...
	Element Text Should Be    xpath=//span[@class='title']    ${Cart_title}

Submit Checkout Details
    [Arguments]    ${first_name}    ${last_name}    ${zip}
    [Documentation]
	...  Fill required detaials at checkout page  ...

    Input Text    id=first-name    ${first_name}
    Input Text    id=last-name    ${last_name}
    Input Text    id=postal-code    ${zip}
    Click Element    id=continue
    Sleep    3s

Error Message for Invalid Details
    [Arguments]    ${act_error}
    [Documentation]
	...  Error message for invalid details  ...

	${exp_error}    Get Text    xpath=//h3[@data-test='error']
    Log To Console    ${exp_error}
    ${contains_bool}=    Run Keyword And Return Status    Should Contain    ${exp_error}    ${act_error}
    Log To Console    ${contains_bool}
    Should Be True    ${contains_bool}

Checkout Overview Page Presence
    [Documentation]
	...  Verify if overview page visible after click on continue ...

	Element Text Should Be    xpath=//span[@class='title']    ${Overview_title}


Checkout Payment Information
    [Documentation]
	...  Verify if payment information present  ...

	Element Text Should Be    xpath=//div[@class='summary_info_label']    Payment Information
	${exp_payment_info}    Get Text    xpath=//div[@class='summary_value_label']
    ${contains_bool}=    Run Keyword And Return Status    Should Contain    ${exp_payment_info}    SauceCard
    Should Be True    ${contains_bool}

Checkout Shipping Information
    [Documentation]
	...  Verify if shipping information present  ...

	Element Text Should Be    xpath=(//div[@class='summary_info_label'])[2]    Shipping Information
	Element Text Should Be    xpath=(//div[@class='summary_value_label'])[2]    Free Pony Express Delivery!

Checkout Price Total Elements Details
    [Documentation]
	...  Verify if price total elements information present  ...

	Element Text Should Be    xpath=(//div[@class='summary_info_label'])[3]    Price Total
	${exp_item_info}    Get Text    xpath=//div[@class='summary_subtotal_label']
    ${contains_bool}=    Run Keyword And Return Status    Should Contain    ${exp_item_info}    Item total
    Should Be True    ${contains_bool}
    ${exp_tax_info}    Get Text    xpath=//div[@class='summary_tax_label']
	${contains_bool}=    Run Keyword And Return Status    Should Contain    ${exp_tax_info}    Tax
    Should Be True    ${contains_bool}

Checkout Total Price Calculation
    [Documentation]
	...  Verify if total calculated price with tax displayed correctly  ...

    ${item_num}    Get Text    xpath=//div[@class='summary_subtotal_label']
    ${item_num}=       String.Split String    ${item_num}    $
    ${item_num}=    Convert To Number    ${item_num}[1]
    ${tot_num}    Get Text    xpath=//div[@class='summary_info_label summary_total_label']
    ${tot_num}=       String.Split String    ${tot_num}    $
    ${tot_num}=    Convert To Number    ${tot_num}[1]
    Run Keyword Unless     ${item_num} < ${tot_num}     Fail

Finish Button Presence and Click
    [Documentation]
	...  Verify if finish button works  ...

    Element Text Should Be    id=finish    Finish
    Click Element    id=finish

Transaction Complete message
    [Documentation]
	...  Verify if transaction completed successfully  ...

    ${exp_message}    Get Text    xpath=//h2[@class='complete-header']
	${contains_bool}=    Run Keyword And Return Status    Should Contain    ${exp_message}    Thank you
    Should Be True    ${contains_bool}



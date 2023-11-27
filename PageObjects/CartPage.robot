*** Settings ***
Resource    ../Locators/LoginPageLocators.robot
Resource    CommonPo.robot

*** Variables ***
${UserName}            standard_user
${Password}            secret_sauce
${Cart_title}          Your Cart
${quantity}            QTY
${Description}         Description
${Product_title}       Products


*** Keywords ***
Cart Icon Presence
    [Documentation]
	...  Verify if cart icon is ppresent or not  ...

    ${Status}=     Run Keyword And Return Status     Element Should Be Visible    xpath=//a[@class='shopping_cart_link']
    Should Be True    ${Status}

Cart Icon Clickable
    [Documentation]
	...  Verify if cart icon is clickable  ...

	Click Element    xpath=//a[@class='shopping_cart_link']
	Element Text Should Be    xpath=//span[@class='title']    ${Cart_title}

Cart UI Elements Presence
    [Documentation]
	...  Verify if cart Ui elements present  ...

	Element Text Should Be    xpath=//div[@class='cart_quantity_label']    ${quantity}
	Element Text Should Be    xpath=//div[@class='cart_desc_label']    ${Description}

Continue Shopping Icon
    [Documentation]
	...  Verify if continue shopping icon is working ...

	Click Element    id=continue-shopping
	Element Text Should Be    xpath=//span[@class='title']    ${Product_title}

Filter Icon Presence
    [Documentation]
	...  Verify if filter icon is ppresent or not  ...

    ${Status}=     Run Keyword And Return Status     Element Should Be Visible    xpath=//select[@class='product_sort_container']
    Should Be True    ${Status}

Change In Dropdown List
    [Documentation]
	...  Verify if dropdown value changes  ...

	${active_val}    Get Text    xpath=//span[@class='active_option']
	Select From List by Value   xpath=//select[@class='product_sort_container']    za
	${new_active_val}    Get Text    xpath=//span[@class='active_option']
	Should Not Be Equal    ${active_val}    ${new_active_val}

Validate if filter functionality works
    [Documentation]
	...  Verify if filter functionality works  ...
	Select Product Filter Option    az
#	Select From List by Value   xpath=//select[@class='product_sort_container']    az
    ${before_filter}    Get Text    xpath=(//div[@class='inventory_item_name '])[1]
    Select Product Filter Option    za
    Select From List by Value   xpath=//select[@class='product_sort_container']    za
    ${after_filter}    Get Text    xpath=(//div[@class='inventory_item_name '])[1]
    Should Not Be Equal    ${before_filter}    ${after_filter}

Select Product Filter Option
    [Documentation]
	...  Select product filter option  ...
    [Arguments]    ${filter_val}
    Select From List by Value   xpath=//select[@class='product_sort_container']    ${filter_val}

Filter Product By Price Low To High
    Select Product Filter Option    lohi
    ${first_price}    Get Text    xpath=(//div[@class='inventory_item_price'])[1]
    ${first_price}=    Remove String        ${first_price}     $
    ${first_price}=    Convert To Number    ${first_price}
    ${second_price}    Get Text    xpath=(//div[@class='inventory_item_price'])[2]
    ${second_price}=    Remove String        ${second_price}     $
    ${second_price}=    Convert To Number    ${second_price}
    Run Keyword Unless     ${first_price} < ${second_price}     Fail

Filter Product By Price High To Low
    Select Product Filter Option    hilo
    ${first_price}    Get Text    xpath=(//div[@class='inventory_item_price'])[1]
    ${first_price}=    Remove String        ${first_price}     $
    ${first_price}=    Convert To Number    ${first_price}
    ${second_price}    Get Text    xpath=(//div[@class='inventory_item_price'])[2]
    ${second_price}=    Remove String        ${second_price}     $
    ${second_price}=    Convert To Number    ${second_price}
    Run Keyword Unless     ${first_price} > ${second_price}     Fail

Add Item To Cart
    [Arguments]    ${prod_name}
    [Documentation]
	...  Add Item to cart  ...
	${Status}=     Run Keyword And Return Status     Element Should Be Visible    xpath=//div[text()='${prod_name}']//following::*[text()='Add to cart'][1]
    Should Be True    ${Status}
	Click Element    xpath=//div[text()='${prod_name}']//following::*[text()='Add to cart'][1]

Remove Option Visible For Added Product
    [Arguments]    ${prod_name}
    [Documentation]
	...  Remove option presence  ...
	Element Text Should Be    xpath=//div[text()='${prod_name}']//following::*[text()='Remove'][1]   Remove

Badge count for Added Product
    [Arguments]    ${exp_badge_cnt}
    [Documentation]
	...  Get Bedge count and validate  ...
    ${badge_cnt}    Get Text    xpath=//span[@class='shopping_cart_badge']
    Should Be Equal    ${exp_badge_cnt}    ${badge_cnt}

Added Product Reflects In Cart
    [Arguments]    ${prod_name}
    [Documentation]
    ...  Added product should reflect in cart  ...
    ${product_added}    Get Text    xpath=//div[@class='inventory_item_name']
    Should Be Equal    ${prod_name}    ${product_added}

Remove Product From Cart
    [Arguments]    ${prod_name}
    [Documentation]
    ...  Remove Product From Cart  ...
    Click Element    xpath=//div[text()='${prod_name}']//following::*[text()='Remove'][1]





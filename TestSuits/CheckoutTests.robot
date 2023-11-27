*** Settings ***
Resource   ../PageObjects/LoginPage.robot
Resource   ../PageObjects/CommonPage.robot
Resource   ../PageObjects/CartPage.robot
Resource   ../PageObjects/CheckoutPage.robot

Documentation   This suite includes checkout tests

Suit Teardown    Close Browser

*** Variables ***
${first_name}    nik
${last_name}     rns
${zip}           12345
${empty_str}
${err_msg}       is required

*** Test Cases ***
Verify Checkout Presence
    [Documentation]    Verify that the checkout is displayed as expected or not

    Login To Application
    Add Item To Cart    Sauce Labs Backpack
    Cart Icon Clickable
    Checkout Icon Presence


Verify Checkout Clickable
    [Documentation]    Verify that the checkout option is clickable

    Checkout Icon Clickable


Verify If Cancel Option Present and CLickable
    [Documentation]    Verify that the Cancel option is working

    Cancel Option Present and Clickable


Verify If Transaction cancelled from Checkout Page
    [Documentation]    Verify that the transaction cancellation successful

    Cancel The Transaction


Verify Empty First Name
    [Documentation]    Verify that the transaction cannot be succeed with empty first name

    Checkout Icon Clickable
    Submit Checkout Details    ${empty_str}    ${last_name}    ${zip}
    Error Message for Invalid Details    ${err_msg}


Verify Empty Last Name
    [Documentation]    Verify that the transaction cannot be succeed with empty last name

    Cancel Option Present and Clickable
    Checkout Icon Clickable
    Submit Checkout Details    ${first_name}    ${empty_str}    ${zip}
    Error Message for Invalid Details    ${err_msg}


Verify Empty zip code
    [Documentation]    Verify that the transaction cannot be succeed with empty zip code

    Cancel Option Present and Clickable
    Checkout Icon Clickable
    Submit Checkout Details    ${first_name}    ${last_name}    ${empty_str}
    Error Message for Invalid Details    ${err_msg}


Verify If Checkout Details success
    [Documentation]    Verify that the transaction succeeded with correct cart details

    Submit Checkout Details    ${first_name}    ${last_name}    ${zip}


Verify If Overview Page Is Visible
    [Documentation]    Verify that the overview of transaction details displayed

    Checkout Overview Page Presence


Verify If Payment Information Present
    [Documentation]    Verify that payment information displayed on overview page

    Checkout Payment Information


Verify If Shipping Information Present
    [Documentation]    Verify that shipping information displayed on overview page

    Checkout Shipping Information


Verify If Price Total Information Present
    [Documentation]    Verify that pricing information displayed on overview page

    Checkout Price Total Elements Details


Verify If Total calculatd correctly
    [Documentation]    Verify that total calculated with tax displayed correctly

    Checkout Total Price Calculation


Verify If Finish Button works
    [Documentation]    Verify that Finidh button of transaction works

    Finish Button Presence and Click


Verify If Transaction Completed
    [Documentation]    Verify that transaction is successful and message displayed

    Transaction Complete message

*** Settings ***
Resource   ../PageObjects/LoginPage.robot
Resource   ../PageObjects/CommonPage.robot
Resource   ../PageObjects/CartPage.robot

Documentation   This suite includes cart tests

Suit Teardown    Close Browser


*** Test Cases ***
Verify Cart Icon Presence
    [Documentation]    Verify that the cart icon is displayed as expected or not

    Login To Application
    Cart Icon Presence


Verify Cart Icon Clickable
    [Documentation]    Verify that the cart icon is clickable

    Cart Icon Clickable


Verify Cart UI Elements
    [Documentation]    Verify that the cart UI elements present

    Cart UI Elements Presence


Verify Continue Shopping Icon Works
    [Documentation]    Verify that the continue shopping icon is working

    Continue Shopping Icon


Verify If Filter Icon Present
    [Documentation]    Verify that the filter icon displayed

    Filter Icon Presence


Verify If Filters Dropdown Changes
    [Documentation]   Verify that the filter dropdown value changes

    Change In Dropdown List


Verify If Filter Functionality Works
    [Documentation]    Verify that the products displayed as per filter option changes

    Validate if filter functionality works


Verify If Filter Product By Price Low to High
    [Documentation]    Verify that the products displayed as per applied filter

    Filter Product By Price Low To High


Verify If Filter Product By Price High to Low
    [Documentation]    Verify that the products displayed as per applied filter

    Filter Product By Price High To Low


Verify If Add to Cart Present and Clickable
    [Documentation]    Verify that Add to Cart option works

    Add Item To Cart    Sauce Labs Backpack


Verify If Remove option available after Add to Cart
    [Documentation]    Verify that Remove option available for added product

    Remove Option Visible For Added Product    Sauce Labs Backpack


Verify If Badge Count Visible for Added Products
    [Documentation]    Verify that Badge count changes as per product addition

    Badge count for Added Product    1


Verify If Added Product Reflected in Cart
    [Documentation]    Verify that added product reflected in cart page

    Cart Icon Clickable
    Added Product Reflects In Cart    Sauce Labs Backpack


Verify If User Can Add more Products
    [Documentation]    Verify that user can add more products

    Continue Shopping Icon
    Add Item To Cart     Sauce Labs Bike Light


Verify If Badge Count Increases after Add more Products
    [Documentation]    Verify that increase in badge count after product add

    Badge count for Added Product    2


Verify If Product Remove From Cart Page
    [Documentation]    Verify that product removed from cart

    Cart Icon Clickable
    Remove Product From Cart    Sauce Labs Bike Light


Verify If Badge Count Decreases after Remove Product
    [Documentation]    Verify that decrease in badge count after product remove

    Badge count for Added Product    1







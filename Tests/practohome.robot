*** Settings ***
Library    SeleniumLibrary
Resource    D:/Robo_Frame_Projects/robo_test1/Keywords/practohome_key.robot
Test Setup   launch practo website
Test Teardown   close practo website

*** Test Cases ***
TC_01 Validate the Practo HomePage
    perform sanity on practo homepage

TC_02 Validate the location List
    validate the location list



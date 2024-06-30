*** Settings ***
Library    SeleniumLibrary
Resource    D:/Robo_Frame_Projects/robo_test1/Keywords/practohome_key.robot
Test Setup    launch practo website
Test Teardown    close practo website

*** Test Cases ***
TC_01 Validate group insurance check
    click on groupinsurance plan

TC_02 Validate health insurance plans for corporates
    Click on healthinsurance plan
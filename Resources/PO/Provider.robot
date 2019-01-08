*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#${Link}  xpath=(.//div[contains(@class, "bg_holder")])[6]
${Link}  xpath=//div[@id='sp_act']/ul/li[1]/div[@class='bg_holder']

*** Keywords ***
click
    Wait Until Page Contains   	        Choose Provider
    SLEEP  2s
    wait until page contains element   	${Link}
    click element                       ${Link}
    Log                                 Choose Provider was successful

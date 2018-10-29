*** Settings ***
Library  SeleniumLibrary


*** Variables ***

*** Keywords ***
Begin Test
    set selenium implicit wait  15
    OPEN BROWSER  https://qatest.setmore.com/  Chrome
    maximize browser window

End test
    sleep  1s
    close browser

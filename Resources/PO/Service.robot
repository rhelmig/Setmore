*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Url}  https://qatest.setmore.com/

*** Keywords ***

Load Scheduler
    go to  ${Url}
    wait until page contains    QA test
    log                         Service Page Loaded

Choose Service
    Wait Until Element Is Visible   	xpath=(.//h2[contains(@class, "service_title")])[1]
    click element                       css:#sf7ca1538215853681 > div.bg_holder > b
    log                                 Service Selected
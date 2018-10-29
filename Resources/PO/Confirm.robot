*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Appointment_check}  //div[contains(@class,'step_tab')]//h2[contains(@class,'service_title')][contains(text(),'Appointment Confirmed')]

*** Keywords ***
load meet
    wait until page contains  Confirm Your Information
    wait until element is visible  //span[contains(text(),'Book My Appointment')]
    Click Element   	xpath=(.//span[contains(@class, "global_btn2_rt")])[1]

confirm_check
    wait until page contains  Appointment Confirmed
    ${PageText} =  get text  ${Appointment_check}
    should be equal as strings  ${PageText}  Appointment Confirmed  ignore_case=false
    log  Appointment Confirmed!

booked
    Page Should Contain   	Book Another Appointment
    log  Smoke Success!

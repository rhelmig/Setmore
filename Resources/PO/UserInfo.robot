*** Settings ***
Documentation   	This is a test user info suite created with ChromeRobot.
Library   	        SeleniumLibrary

*** Variables ***
${name}   	    Joe Smith
${email}   	    JoeSmith@test.com
${phone}   	    4045551234
${address}   	123 Smith St
${city}   	    Dacula
${state}   	    GA
${zip}   	    30019
${comments}   	This is a test and only a test.

*** Keywords ***
user load
    wait until page contains  Sign In
    Click Element   	skip_step
    wait until page contains  Enter Your Information

info
#    [Arguments]   ${name}  ${email}  ${phone}  ${address}  ${city}  ${state}  ${zip}  ${comments}
   	Input Text   	cust-IName   	${name}
	Input Text   	cust-IEmailId   ${email}
	Input Text   	cust-PhoneNo   	${phone}
	Input Text   	cust-Address   	${address}
	Input Text   	cust-City   	${city}
	Input Text   	cust-State   	${state}
	Input Text   	cust-Zip   	    ${zip}
	Input Text   	cust-Comments   ${comments}
    Mouse Over   	cust-continue
    wait until element is visible  //*[@id="cust-continue"]
    Click Element   	cust-continue
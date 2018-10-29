*** Variables ***
${Browser}   	Chrome
${email}   	    rickhelmig@hotmail.com
${password}   	fisher1214

*** Keywords ***

Login Admin
    Open Browser  	            https://my.setmore.com/dashboard#reports   	${BROWSER}
	maximize browser window
	set browser implicit wait   10
	Input Text   	            username   	${email}
	Input Password   	        password   	${password}
	Click Button   	            xpath=.//input[contains(normalize-space(@class), "global_btn2_rt signin_btn")]
	Wait Until Page Contains   	Calendar
	Log                         Calendar Page Loaded

Schedule Select
    Wait Until Page Contains        	Weekly
    Click Link   	                    startCalendar

    ${element}   Get Webelement         xpath=.//td[contains(., '3pm3pm3pm3pm3pm3pm3pm')]/child::div
    Click Element   ${element}

    Wait Until Element Is Visible   	editApptPopup
    Element Should Be Visible   	    xpath=.//h3[contains(@class, "appt-header-title")]

Create Meeting
    click element                       //*[@id="editApptPopup"]/div[3]/ul/li[2]/div[1]/a
    Open Context Menu                   xpath=(.//a[contains(@class, "appt-dropdown-btn")])[3]
	Click Element   	                xpath=(.//span[contains(@class, "appt-details-dropdown-service-title")])[4]
    click element                       id:editApptPopup
    wait until page contains element    //*[@id="editApptPopup"]/div[3]/ul/li[2]/div[1]/a
    click link                          //*[@id="editApptPopup"]/div[3]/ul/li[2]/div[1]/a

Select Client
#    sleep  2s
	Wait Until Page Contains Element   	xpath=.//input[contains(@class, "appt-customer-input")]
    Click Element                   	xpath=.//li[contains(@class, "tab-customer")]
	Input Text                      	xpath=.//input[contains(@class, "appt-customer-input")]   	Test Test
    Wait Until Page Contains        	Test Test
#    Sleep  2s
	${element}  get webelement          class:appt-suggestion-dropdown-title
	click element  ${element}
    Wait Until Element Is Visible   	xpath=.//a[contains(normalize-space(@class), "appt-save-btn")]
#    sleep  1s
    click link                          Save Appointment
    page should contain                 Test Review $ 50
    Log                                 Meeting Schduled

Delete Meeting
    Click Element   	                xpath=.//div[contains(@class, "fc-event-bg")]
#	sleep  2s
	Wait Until Element Is Visible   	xpath=.//h2[contains(normalize-space(.), 'Appointment Details')]
    select window                       xpath=.//h2[contains(normalize-space(.), 'Appointment Details')]
    click element                       ///span[@innertext='Edit Appointment ']
    wait until element is visible       .appt-delete-btn
    click link                          Delete
    wait until element is visible       //span[#'delete-confirmation-btn']
    select window                       //div[#'delete-confirmation-popup']
    Click Element   	                //span[#'delete-confirmation-btn']
    log                                 Dashboard Smoke success!


*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${meeting_date}      //td[@class='datepickerSelected']//a[@href='#']
${meeting_time}      //ul[@class='afternoon']//li[10]//a[1]
${meeting_date2}     //tbody[@class='datepickerDays']//tr[1]//td[6]//a[1]
${meeting_time2}     //a[contains(text(),'3:30 pm')]

*** Keywords ***
Meeting
    wait until page contains            Your Timezone:
    sleep                               2s
    wait until page contains element    //*[@id="calendars"]    timeout=10
    click element                        ${meeting_date2}
    wait until page contains element    //*[@id="timesheet"]    timeout=10
    click element                        ${meeting_time2}



*** Settings ***
Documentation   	A quick smoke test for the Scheduler Admin.
...                 Goal is to log the user in on the Dashboard, create a meeting, confirm details,
...                 then delete the meeting.
Library   	 SeleniumLibrary   15.0   5.0
Resource     Resources/DashboardApp.robot

*** Variables ***

*** Test Cases ***
Logged out User can connect to Dashboard
    DashboardApp.Login Admin

User can Select a Schedule time
    DashboardApp.Schedule Select

User can create a Meeting
    DashboardApp.Create Meeting

User can choose client
    DashboardApp.Select Client

User can Delete the Meeting
    DashboardApp.Delete Meeting

# Bug in app: first click of the meeting opens then closes the pop up on the first click.
# It appears that its attempting to load Appt Detail pop-up before actually 'fetching the details'.



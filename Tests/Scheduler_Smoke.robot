*** Settings ***
Documentation  Sample proof of concept for a Meeting Scheduler application
Resource    ../Resources/Common.robot
Resource    ../Resources/SchedulerApp.robot

Suite Setup  Begin Test
Suite Teardown  End Test

*** Variables ***
${Url} =  https://qatest.setmore.com/  #Global change for environment
${browser} =  Chrome

*** Test Cases ***

User can load the Meeting scheduler
    Open Scheduler
User can select a Service
    Select Service
User can select a Provider
    Choose Provider
User to can select a meeting Date/Time
    Select Meeting
User can enter their Info
    Enter user Info
User can book their meeting
    Book it
User recieves a Meeting confirmation
    Confirm

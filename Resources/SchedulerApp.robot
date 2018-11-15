*** Settings ***
Library     SeleniumLibrary
Resource  ./PO/Provider.robot
Resource  ./PO/Service.robot
Resource  ./PO/Date.robot
Resource  ./PO/UserInfo.robot
Resource  ./PO/Confirm.robot
*** Keywords ***

Open Scheduler
    Service.Load Scheduler

Select Service
    Service.Choose Service

Choose Provider
    Provider.click

Select Meeting
    Date.meeting

Enter user Info
    UserInfo.user load
    UserInfo.info

Book it
    Confirm.load meet

Confirm
    Confirm.confirm_check
    Confirm.booked
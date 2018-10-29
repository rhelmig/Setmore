from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

browser = webdriver.Chrome()


def date_wait_day():
    element = WebDriverWait(browser, 20).until(EC.visibility_of((By.CLASS_NAME, "datepicke_holder")))
    element.click()


def date_wait_time():
    element = WebDriverWait(browser, 20).until(EC.visibility_of_element_located((By.ID, "timesheet")))
    element.click()


def helper():
    find_date = ""

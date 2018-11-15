from selenium import webdriver
from pytest import mark
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as ec
import time


# pytest -v -s --html=report.html
# pytest -v -s --html=report.html --tb=short

driver = webdriver.Chrome()
driver.get('https://my.setmore.com/')


@mark.function
def test_start():
    driver.maximize_window()
    assert driver.current_url == 'https://my.setmore.com/'


@mark.function
def test_login():
    driver.find_element_by_css_selector('#username').send_keys('rickhelmig@hotmail.com')
    driver.find_element_by_css_selector('#password').send_keys('asdf1234')
    driver.find_element_by_css_selector("[type='submit']").click()


@mark.function
def test_calendar_load():
    WebDriverWait(driver, 10).until(ec.presence_of_element_located((By.ID, 'side-menu')))
    assert ('Calendar' in driver.page_source)
    print('Calender page loaded')


@mark.function
def test_choose_meeting():
    WebDriverWait(driver, 10).until(ec.visibility_of_element_located((By.ID, 'calendar-staffList')))
    driver.find_element_by_css_selector('.fc-slot40 div').click()
    WebDriverWait(driver, 10).until(ec.presence_of_element_located((By.CSS_SELECTOR, '.appt-header-title')))
    driver.find_element_by_class_name('appt-dropdown-btn').click()
    driver.find_element_by_link_text('Select a Service').click()
    driver.find_element_by_css_selector(
        "[data-original-title='Automation'] .appt-details-dropdown-service-title"
    ).click()
    WebDriverWait(driver, 10).until(ec.visibility_of_element_located((By.XPATH, '//*[@id="custom-appt-cost"]')))
    driver.find_element_by_xpath("/html//div[@id='editApptPopup']//a[.='Continue']").click()


@mark.function
def test_choose_customer():
    WebDriverWait(driver, 10).until(
        ec.presence_of_element_located((By.CSS_SELECTOR, '.appt-customer-input-search-icon')))
    customer = driver.find_element_by_xpath(
        "/html//div[@id='editApptPopup']//input[@class='appt-customer-input']")
    customer.send_keys('Sam ')
    WebDriverWait(driver, 10).until(ec.element_to_be_clickable, '.appt-suggestion-dropdown-title')
    time.sleep(3)
    driver.find_element_by_css_selector('.appt-suggestion-dropdown-title').click()


@mark.function
def test_save_appointment():
    WebDriverWait(driver, 10).until(ec.presence_of_element_located((By.LINK_TEXT, 'Save Appointment')))
    driver.find_element_by_link_text('Save Appointment').click()
    assert ('Sam Test' in driver.page_source)
    print('Schedule Test Complete!')






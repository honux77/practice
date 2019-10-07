from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome()
driver.get("https://www.acmicpc.net/login")

driver.implicitly_wait(15)

driver.find_element_by_name('login_user_id').send_keys('horong54')
driver.find_element_by_name('login_password').send_keys('rueiwo38')
driver.find_element_by_id('submit_button').click()


driver.get("https://www.acmicpc.net/submit/10947")

driver.close()
require 'page-object'
require 'selenium-webdriver'
require 'require_all'

Before ('@UI') do
  @browser = Selenium::WebDriver.for :chrome
   @browser.manage.window.maximize
end

After ('@UI')  do
  @browser.close
end

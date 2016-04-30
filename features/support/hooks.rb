require 'page-object'
require 'selenium-webdriver'
require 'require_all'

Before do|scenario|

  @browser = Selenium::WebDriver.for :chrome
   @browser.manage.window.maximize
end

After  do
  @browser.close
end

class IPhonePage
include PageObject

page_url 'http://store.demoqa.com'

def homepage
  element = browser.find_element(:class=> "buynow")
  element.click()
end
  def clickOnAllproducts
    # Selects IPhone from all products drop-down
    products=  browser.find_element(:id=> "menu-item-33")
     browser.action.move_to(products).perform
    sleep(2)
    iphone= browser.find_element(:id,"menu-item-37")
    iphone.click
  end
  def selectIphone
    # Selects IPhone and adds it to cart
    iphone =browser.find_element(:xpath=> '//*[@id="default_products_page_container"]/div[4]/div[2]/form/div[2]/div[1]/span/input')
    iphone.click()
    sleep(2)
    checkout=browser.find_element(:xpath=> '//*[@id="fancy_notification_content"]/a[1]')
    checkout.click()
    continue =browser.find_element(:class=>'step2')
    continue.click
  end
  def shippinginformation
    sleep(2)
    # Selects Albania as country for shipping cost
    country =browser.find_element(:id=> 'uniform-current_country')
    country.click()
    country.find_elements( :tag_name => "option" ).find do |option|
      option.text == 'Albania'
    end.click
    country.click
    # Fills out information for shipping
    browser.find_element(:id=>'wpsc_checkout_form_9').send_keys("janetwan2804@gmail.com")
    browser.find_element(:id=>'wpsc_checkout_form_2').send_keys("Janet")
    browser.find_element(:id=>'wpsc_checkout_form_3').send_keys("Wan")
    browser.find_element(:id=>'wpsc_checkout_form_4').send_keys("3700 Preston Road")
    browser.find_element(:id=>'wpsc_checkout_form_5').send_keys("Plano")
    browser.find_element(:id=>'wpsc_checkout_form_6').send_keys("Texas")
    country =browser.find_element(:id=>"region_country_form_7")
    country.find_elements( :tag_name => "option" ).find do |option|
      option.text == 'USA'
    end.click
    country.click
    browser.find_element(:id=>'wpsc_checkout_form_8').send_keys("75093")
    browser.find_element(:id=>'wpsc_checkout_form_18').send_keys("4692302538")
    browser.find_element(:id=>'shippingSameBilling').click()
    browser.find_element(:xpath=>'//*[@id="wpsc_shopping_cart_container"]/form/div[4]/div/div/span/input').click
    total=browser.find_element(:id=>'checkout_total')
   #Validates total cost for items
    total.text.equal?("$293.00")
  end
  def addtocart
    # Adds three items to cart
    for i in (0..2)
    iphone =browser.find_element(:xpath=> '//*[@id="default_products_page_container"]/div[4]/div[2]/form/div[2]/div[1]/span/input')
    iphone.click()
    sleep(1)
    checkout=browser.find_element(:xpath=> '//*[@id="fancy_notification_content"]/a[1]')
    checkout.click()
    products=  browser.find_element(:id=> "menu-item-33")
    browser.action.move_to(products).perform
    iphone= browser.find_element(:id,"menu-item-37")
    iphone.click
    end
    browser.find_element(:class=>'cart_icon').click
  end
  def validatecart
    # Validates that removing all items from cart clears the cart
    browser.find_element(:name=>'quantity').attribute('value') == "3"
    browser.find_element(:xpath=>'//*[@id="checkout_page_container"]/div[1]/table/tbody/tr[2]/td[6]/form/input[4]').click
    if  browser.page_source.include? 'Oops, there is nothing in your cart.'
      print "The test has passed"
    else
      print "The test has failed "
    end

  end
end
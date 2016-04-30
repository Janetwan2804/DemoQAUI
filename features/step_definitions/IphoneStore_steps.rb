Given(/^I am on the QA demo page$/) do
  visit(IPhonePage)
  sleep (2)
end
And(/^I Navigate to IPhone page$/) do
on(IPhonePage).clickOnAllproducts
  sleep (5)
end
And(/^I Add Iphone to Cart$/)do
  on(IPhonePage).selectIphone
end
And(/^I Fill out Shipping Information and Purchase$/)do
  on(IPhonePage).shippinginformation
end
And (/^I Add 3 Things to My Cart$/)do
  on(IPhonePage).addtocart
end
And (/^I Remove Items and Validate They are Deleted$/)do
  on(IPhonePage).validatecart
end
Given(/^I make a GET request to fetch data$/) do
  url='https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=YvadoPCJVo0XpFQiW9VfSKOosY2jqeDryAgyTkpk&location=Austin+TX&ev_network=ChargePoint+Network'
  resp_TDM=RestClient.get url,:'Accept'=>'application/json',:'Content_Type'=>'application/json'
   @resp_body = JSON.parse(resp_TDM.body)
end
When(/^I verify Hyatt is listed$/) do
  @hyatt=@resp_body["fuel_stations"].select {|x| x['station_name'] == 'HYATT AUSTIN'}
end
Then(/^I retrieve and store stationid$/) do
  $stationid= @hyatt[0]['id']
  p "Station ID for Hyatt Austin is #{$stationid}"
end
Given(/^I make a GET request to fetch by stationid$/) do
  url='https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=YvadoPCJVo0XpFQiW9VfSKOosY2jqeDryAgyTkpk&location=Austin+TX&ev_network=ChargePoint+Network'
  resp_TDM=RestClient.get url,:'Accept'=>'application/json',:'Content_Type'=>'application/json'
  resp_body = JSON.parse(resp_TDM.body)
  @hyatt=resp_body["fuel_stations"].select {|x| x['id'] == $stationid}
end
When(/^I store address based off of id$/) do
  streetaddress=  @hyatt[0]['street_address']
  city = @hyatt[0]['city']
  state = @hyatt[0]['state']
  zipcode = @hyatt[0]['zip']
  @address = streetaddress + ' ' + city + ',' + state + ' ' + zipcode
end
Then(/^I validate address is correct$/) do
@address.include?('208 Barton Springs Rd Austin,TX 78704').should == true
end

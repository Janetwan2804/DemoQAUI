Feature: API tests
  Scenario: Get StationId of Hyatt
    Given I make a GET request to fetch data
    When I verify Hyatt is listed
    Then I retrieve and store stationid

   Scenario: API TEST TWO
     Given I make a GET request to fetch by stationid
     When I store address based off of id
     Then I validate address is correct

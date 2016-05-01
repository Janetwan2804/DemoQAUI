Feature: HomeAway Web Application UI Feature

  @UI
  Scenario: Purchase Iphone
    Given I am on the QA demo page
    When I Navigate to IPhone page
    And I Add Iphone to Cart
    Then I Fill out Shipping Information and Purchase

    @UI
  Scenario: Clearing Cart
    Given I am on the QA demo page
    When I Navigate to IPhone page
    And I Add 3 Things to My Cart
    Then I Remove Items and Validate They are Deleted


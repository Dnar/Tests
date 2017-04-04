@client

Feature: Qlean-client

  Scenario: Login and first order
    Given I am on qlean page
    When I change room and bathroom
    When I fill in popup field with sms_code
    When I should see some text

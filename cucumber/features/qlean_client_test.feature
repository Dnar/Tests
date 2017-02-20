@client

Feature: Qlean-client
  
  Scenario: Login and first order
    Given I am on page "http://localhost:8080"
    When I change room and bathroom
    When I fill in popup field with sms_code
    Then I have see in result "Выберите адрес"

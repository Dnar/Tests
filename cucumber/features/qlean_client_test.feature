@client

Feature: Qlean-client
  
  Scenario: Login and first order
    Given I am on page "http://localhost:8080"
    When I change room and bathroom
    When I fill in field with the text "9999999999"
    When I click button "Рассчитать стоимость"
    When I should see in popup "Введите код из смс"
    When I fill in popup field with sms_code
    Then I have see in result "Оформление заказа"

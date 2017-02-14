Feature: Corgi
  
  Scenario: View crm page
    Given I am on page "http://localhost:7001"
    When I fill in field with the text "9999999999"
    When I click button "Получить код"
    When I should see in result "Введите код из смс"
    When i fill in field with sms_code
    Then I have see in result "Пользователи"
    When I fill in field with the text "Andrey"
    Then I have see in result "Andrey"


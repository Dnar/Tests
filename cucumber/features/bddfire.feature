Feature: Corgi
  
  Scenario: View crm page
    Given I am on page "http://localhost:7001"
    When I fill in field with the text "9999999999"
    When I click button "Получить код"
    When I should see in result "Введите код из смс"
    When I fill in field with sms_code
    Then I have see in result "Пользователи"


  Scenario: Add new CallType for cleaner
    When I click link "Админка"
    When I add in field the text "Домогательства"
    When I select element "Клининг → Запрос на блокировку"
    When I press button "onSubmit"
    Then I should see text "Новый тип обращения"

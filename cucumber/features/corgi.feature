@corgi
Feature: Corgi
  
  Scenario: View crm page

    Given I am on page "http://localhost:7001"
    When I fill in field with the text "9999999999"
    When I click button "Получить код"
    When I should see in result "Введите код из смс"
    When I fill in field with sms_code
    Then I have see in result "Пользователи"


  Scenario: Add new CallType for cleaners

    When I click link "Админка"
    When I add in field the text "МЯтнЫЕ коНФеты"
    When I select element "Клинерские сценарии"
    When I press button "Добавить"
    Then I should see text "Новый тип обращения"

  Scenario: Add new client

    When I click button 
    When I fill in fields last name, first name and middle name with the text "Петров", "Иван", "Михайлович"
    When I add in field phone the text "9021234343"
    When I add in field email the text "petro33@list.ru"
    When I check element some elements
    When I press button for create user
    Then I should see some text in page

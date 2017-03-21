@corgi
Feature: Corgi

  Scenario: View crm page

    Given I am on page "http://localhost:7001"
    When I fill in field with the text "9999999999"
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
    When I fill in fields last name, first name and middle name with the text "Мордашов", "Григорий", "Моисеевич"
    When I add in field phone the text "9051224346"
    When I add in field email the text "kris11@list.ru"
    When I check element some elements
    When I press button for create user
    Then I should see some text in page


  Scenario: Add new address for client

    When I select element "Клиентские сценарии" in group
    When I select element "Добавление адреса" in theme
    When I should see in window "Город", "Улица", "Дом", "Корпус", "Строение", "Квартира", "Подъезд", "Домофон", "Этаж"
    When I add in field city with text "Москва"
    When I add in field street with text "Бойцовая"
    When I add in field number with text "14"
    When I add in field housing with text "1"
    When I add in field building with text "2"
    When I add in field apartment with text "666"
    When I add in field entrance with text "3"
    When I add in field intercom with text "4в3232"
    When I add in field floor with text "16"
    When I click "Создать обращение"
    Then I shoul see full address in card

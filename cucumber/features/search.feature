@search
Feature: Search and add new Call for users

  Scenario: Search users

    Given I am on page "http://localhost:7001"
    When I fill searchfield with the text "milosh@list.ru" 
    When I click result for open user card
    Then I have see in result some content

  Scenario: Add new address for client

    When i select group "Клиентские сценарии"
    When i select theme "Добавление адреса"
    When i select some city
    When i fill address field
    When i fill comment field
    When I click submit button
    Then i should see in page full address


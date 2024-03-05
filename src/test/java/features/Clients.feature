@test
Feature: Clients tests http://inv.bg/clients/manage

  Background:
    Given user is logged in the system
    Then logged user email should be "karamfilovs@gmail.com"
    When I delete all clients

  Scenario Outline: Can add new client with valid information/data
    When I navigate to Clients page
    Then Add New Client button should contain text "Нов клиент"
    When I create new client with name "<name>" and vat "<vat>" and address "<address>" and town "<town>"
#    When I create new client with required fields like name "<name>" and "<address>" and town "<town>"
    Then client message with text should be displayed "Клиентът е добавен успешно."
    Examples:
      | name          | vat        | address  | town    |
      | АЛ-ИМПОРТ ООД | 123123122  | Ruski 20 | Plovdiv |
      | Pragmatic LTD | 123        | 20 Руски | Пловдив |
      | Грабо ООД     | 123123122e | ruski 20 | СОФИЯ   |


@test
Feature: Clients tests http://inv.bg/clients/manage

  Background:
    Given user is logged in the system
    Then logged user email should be "karamfilovs@gmail.com"
    When I delete all clients


  Scenario: Can navigate to clients page
    When I navigate to Clients page
    Then Add New Client button should contain text "Нов клиент"

  Scenario Outline: Can add new client with valid information/data
    When I navigate to Clients page
    Then Add New Client button should contain text "Нов клиент"
    When I create new client with name "<name>" and vat "<vat>" and address "<address>" and town "<town>"
    Then client message with text should be displayed "<add_success>"
    Examples:
      | name          | vat        | address           | town    | add_success                 |
      | АЛ-ИМПОРТ ООД | 123123122  | Ruski 20          | Plovdiv | Клиентът е добавен успешно. |
      | Pragmatic LTD | 123        | 20 Руски          | Пловдив | Клиентът е добавен успешно. |
      | Грабо ООД     | 123123122e | ruski 20 ruski 20 | СОФИЯ   | Клиентът е добавен успешно. |


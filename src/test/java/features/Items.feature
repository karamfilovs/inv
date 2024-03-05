@test
Feature: Items tests http://inv.bg/objects/manage

  Background:
    Given user is logged in the system
    Then logged user email should be "karamfilovs@gmail.com"
    When I navigate to Items page
    Then Add New Item button should contain text "Нов артикул"


  Scenario Outline: Can create neScenario Outline: Can create new item with valid information
    When I create new item with name "<name_bgn>" and nameENG "<name_eng>" and price "<price>" and priceQuantity "<price_quantity>"
    When I delete all items
    Examples:
      | name_bgn | name_eng | price | price_quantity |
      | Кафе     | Coffee   | 10    | 1              |
    When I create new item with name "<name_bgn>" and nameENG "<name_eng>" and price "<price>" and priceQuantity "<price_quantity>"
    Then item message with text "Артикулът е добавен успешно." should be displayed
    When I delete all items
    Examples:
      | name_bgn         | name_eng       | price | price_quantity |
      | Кафе             | Coffee         | 10    | 1              |
      | Джони Уокър      | Johny Walker   | 25.56 | 1.1            |
      | Курс: Тестване 1 | Testing Course | 650   | 20             |

  Scenario Outline: Create a new item with all fields included
    When I create new item with name "<name_bg>" and english name "<name_eng>" and price "<price>" and quantity "<quantity>" and account "<account>" and accountingBatch "<account_batch>"
    Then item message with text "Артикулът е добавен успешно." should be displayed
    Examples:
      | name_bg | name_eng   | price | quantity | account | account_batch |
      | Диня    | Watermelon | 1     | 1        | 1       | 1             |
      | Пъпеш   | Melon      | 1     | 1        | 1       | 1             |

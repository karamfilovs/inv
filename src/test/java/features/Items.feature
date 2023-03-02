@test
Feature: Items tests http://inv.bg/objects/manage

  Background:
    Given user is logged in the system
    Then logged user email should be "karamfilovs@gmail.com"
    When I navigate to Items page
    Then Add New Item button should contain text "Нов артикул"


  Scenario Outline: Can create new item with valid information
    When I create new item with name "<name_bgn>" and nameENG "<name_eng>" and price "<price>" and priceQuantity "<price_quantity>"
    When I delete all items
    Examples:
      | name_bgn         | name_eng       | price | price_quantity |
      | Кафе             | Coffee         | 10    | 1              |
      | Джони Уокър      | Johny Walker   | 25.56 | 1.1            |
      | Курс: Тестване 1 | Testing Course | 650   | 20             |

@Test
Feature: Get Users

  Background:
    * url baseUrl
    # * configure headers = {Authorization: 'Bearer ' + token}
    * header Content-Type = 'application/json'
    * path 'users'

  Scenario: Get - All Users
    When method GET
    Then status 200

  Scenario: Get - User By Valid ID
    And param page = 1
    When method GET
    Then status 200
    And match response[0].id == 1
    And match response[0].email == 'Sincere@april.biz'

  Scenario: Get - User By Invalid ID
    //Given path 'users'
    And param page = 11
    When method GET
    Then status 404


  Scenario: Get - Validate All users Fields
   // Given path 'users'
    When method GET
    Then status 200
    And match each  response[*].id == '#number'
    And match each  response[*].name == '#string'
    And match each  response[*].email == '#string'
    And match each  response[*].address.street == '#string'
    And match each  response[*].address.suite == '#notnull'

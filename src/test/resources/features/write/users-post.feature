@Test
Feature: Post Users

  Background:
    * url baseUrl
    # * configure headers = {Authorization: 'Bearer ' + token}
    * header Content-Type = 'application/json'
    * def name = randomName()
    * def email = randomEmail()

  Scenario: Create - A New User
    * def payload = read('classpath:features/data/request/request-users.json')
    Given path 'users'
    And request payload
    When method POST
    Then match responseStatus == httpStatus.success.created
    And match response.id == "#number"

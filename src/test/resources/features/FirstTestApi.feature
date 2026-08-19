Feature: Simple API Test

Scenario: Test API GET

Given url 'https://ipinfo.io/161.185.160.93/geo'
When method GET
* def status = responseStatus
Then print status

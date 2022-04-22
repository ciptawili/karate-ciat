Feature: test

  Background:
    * url testUrl


  Scenario: Get List User
    * def responseData =
    """
    {
      "page": #number,
      "per_page": #number,
      "total": #number,
      "total_pages": #number,
      "data": [
          {
              "id": #number,
              "email": "#string",
              "first_name": "#string",
              "last_name": "#string",
              "avatar": "#string"
          },
          {
              "id": #number,
              "email": "#string",
              "first_name": "#string",
              "last_name": "#string",
              "avatar": "#string"
          }
          ],
      "support": {
        "url": "#string",
        "text": "#string"
      }
    }
    """
    Given path 'users'
    And param page = '2'
    When method get
    Then status 200
    And match response contains any responseData
    * match response.data[*] != '#null'
    * match response.data[*].id != null
    * match response.data[*].email != null
    * match response.data[*].first_name != null
    * match response.data[*].avatar != null

  @test
  Scenario: Create User
    Given path 'users'
    * def body =
    """
    {
    "name": "morpheus",
    "job": "leader"
    }
    """
    * def responsedata =
    """
    {
    "name": "#string",
    "job": "#string",
    "id": "#string",
    "createdAt": "#string"
    }
    """
    And request body
    When method post
    Then status 201
    And match response == responsedata
    * match response.id != '#null'
    * match response.name != '#null'
    * match response.job != '#null'
    * match response.name == 'morpheus'
    * match response.job == 'leader'


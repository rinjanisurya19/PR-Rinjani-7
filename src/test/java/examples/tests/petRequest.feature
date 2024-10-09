Feature: Pet API Tests

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"

    Scenario: Add New Pet to Store
      * def reqBody = { "id": 19, "category": { "id": 19, "name": "cow"}, "name": "doggie", "photoUrls": ["string"],"tags": [{"id": 19,"name": "string"}],"status": "available"}
      When url "https://petstore.swagger.io/v2/pet"
      And  request reqBody
      And method post
      Then print response
      And status 200


    Scenario: Find Pet by Status
      When url "https://petstore.swagger.io/v2/pet/findByStatus?status=available"
      And method get
      Then print response
      And status 200

    Scenario: Find Pet by ID
    When url "https://petstore.swagger.io/v2/pet/19"
    And method get
    Then print response
    And status 200

  Scenario: Update Existing Pet
    * def reqBody = { "id": 1705, "category": { "id": 1705, "name": "dog" }, "name": "doggy", "photoUrls": [ "string" ], "tags": [ { "id": 1705, "name": "cat"}], "status": "sold" }
    When url "https://petstore.swagger.io/v2/pet"
    And request reqBody
    And method put
    Then print response
    And status 200


  Scenario: Delete Pet by ID
    * def reqHeader = { 'api-key' : 'special-key' }
    When url "https://petstore.swagger.io/v2/pet/1705"
    And request reqHeader
    And method delete
    Then print response
    And status 200
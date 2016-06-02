Feature: Provision and Install
   Background:
    Given I have a running server
    And I provision it

  Scenario: Install Nodejs
    When I install Nodejs
    Then It should be successful
    And Nodejs should exist in system path
    And Npm should exist in the system path

  Scenario: Install MongoDB
    When I install MongoDB
    Then It should be successful
    And pip should exist in system path
    And pymongo should exist in system path
    And it mongod service should be running

  Scenario: Install Bower, mocha, gulp, nodemon
    When I install dev-tools
    Then It should be successful
    And dev-tools to exist in system path

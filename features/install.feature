Feature: Provision and Install

  Background:
    Given I have a running server
    And I provision it

  Scenario: Install Nodejs
    When I install Nodejs
    Then it should be successful
    And Nodejs should exist in system path

  Scenario: Install Npm
    When I install Nodejs
    Then it should be successful
    And Npm should exist in the system path

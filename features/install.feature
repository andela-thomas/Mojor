Feature: Provision and Install

  Background:
    Given I have a running server
    And I provision it

  Scenario: Install Nodejs
    When I install Nodejs
    Then it should be successful
    And Nodejs should exist in system path
    And Npm should exist in the system path

  #Scenario: Install bower
  #  When I install bower
  #  Then it should be successful
  #  And Bower should exist in the system path

  #Scenario: Install mocha
  #  When I install mocha
  #  Then it should be successful
  #  And mocha should exist in the system path

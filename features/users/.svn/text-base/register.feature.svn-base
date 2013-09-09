Feature: Register
  In order to get access to protected sections of the site
  A user
  Should be able to Register

    Scenario: User register successfully
      Given I exist as a user
      And I am not logged in
      When I register with valid credentials
      Then I see a successful register message
      Then I should be register
      
    Scenario: User enters wrong username
      Given I exist as a user
      And I am not logged in
      When I register with a wrong username
      Then I see an invalid register message

    Scenario: User enters wrong password
      Given I exist as a user
      And I am not logged in
      When I register with a wrong password
      Then I see an invalid register message

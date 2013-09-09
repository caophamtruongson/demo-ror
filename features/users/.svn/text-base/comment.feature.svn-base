Feature: Comment
  In order to get access to protected sections of the site
  A user
  Should be able to comment

    Scenario: User register and comment successfully
      Given I exist as a user
      When I register with valid credentials
      Then I see a successful register message
	  When I comment with valid credentials
	  Then I see a successful comment
	  
	Scenario: User enters wrong title
      Given I exist as a user
      When I register with valid credentials
      Then I see a successful register message
      When I comment with a wrong title
      Then I see an invalid comment message

    Scenario: User enters wrong content
      Given I exist as a user
      When I register with valid credentials
      Then I see a successful register message
      When I comment with a wrong content
      Then I see an invalid comment message
Feature: Blog
  In order to get access to protected sections of the site
  A user
  Should be able to Blog Create - Show - Edit - Destroy

    Scenario: User signs in and show blog successfully
      Given I exist as a user
      And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I see to the blog
      Then I see an invalid blog message
      
   Scenario: User signs in and create blog successfully
      Given I exist as a user
      And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I see to the blog
      Then I see an invalid blog message
      When I create with valid credentials
      Then I see a successful create message
      
   Scenario: User signs in and create blog with a wrong title
      Given I exist as a user
      And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I see to the blog
      Then I see an invalid blog message
      When I create with a wrong title
      Then I see an invalid create blog message
      
   Scenario: User signs in and create blog with a wrong content
      Given I exist as a user
      And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I see to the blog
      Then I see an invalid blog message
      When I create with a wrong content
      Then I see an invalid create blog message

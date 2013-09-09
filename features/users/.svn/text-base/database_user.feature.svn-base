Feature: Manage User
	Scenario: Create User
	    Given I want contructor user username with "vu.son", password with "123456", email with "vu.son@mulodo.com"
	    When I call create User
	    Then I should see user have databaes
	    
	Scenario: Update User
		Given I find user username with "vu.son"
		When I will update username with "vu.son"
		Then I should see user have username with "vu.son"
	
	Scenario: Delete User
		Given I find user username delete with "vu.son"
		When I will delete username "vu.son"
		Then I should see not user database
	
	Scenario: transaction
    	Given contructor user
     
	       | name 		| password  |       email         |
	       | vu.son     | 123456    | vu.son@mulodo.com   |
	    When I will create user
	    Then I should not see user
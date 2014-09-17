Feature: 
As a new user
I want to be able to create an account
So I can start using the app

Scenario: New users should be able to sign up
  Given I am a new user
  When I open the app
  Then I want to be able to sign up

Scenario: After sign up, basic profile information should be provided
  Given I have completed the sign up process
  When I exit the sign up screen
  Then I should be logged in 
  And I want to be taken to the profile wizard to complete my profile

Scenario: Users should not be able to proceed without entering basic profile information
  Given I have signed up but not entered any profile information
  When I open the app
  Then I want to be taken to the profile wizard to complete my profile



Feature: GmailTest

  Scenario Outline: Verify Sending and Deleting of a letter
    Given I go to gmail
    When I insert the login "<email>"
    And  I insert the password "<password>"
    Then I should check if I logged in
    And  I should send the letter
    When I send a letter to "nazar_lw@ukr.net" with subject "Test subject" and content "Test content of the letter"
    Then I should check if the subject of the last letter is equal to  "Test subject"
    Then I should delete the letter and check whether it was really deleted
    
  Examples:

    | email                    | password             | 
    | testepamivan@gmail.com   | myprojectmailsende@1 | 
    
Feature: Library Management System

  Background:
    Given the library system is operational
    And the system contains a variety of books in the database

  Scenario Outline: Search for books using different search parameters
    Given I am on the library search page
    When I select "<search_parameter>" as the search parameter
    And I enter "<search_value>" in the search field
    And I click the "Search" button
    Then I should see books matching "<search_value>" in the search results
    And the results should only contain books with matching "<search_parameter>"

    Examples:
      | search_parameter | search_value           |
      | Title            | The Great Gatsby       |
      | Author           | J.K. Rowling           |
      | ISBN             | 978-0-306-40615-7      |

  Scenario: Perform advanced search with multiple parameters
    Given I am on the advanced search page
    When I enter "Stephen King" in the author field
    And I select "1990-2000" as the publication year range
    And I select "Horror" from the genre dropdown
    And I click the "Search" button
    Then I should see books matching all specified criteria
    And all results should be written by "Stephen King"
    And all results should be published between "1990" and "2000"
    And all results should belong to the "Horror" genre

  Scenario Outline: Book checkout process for different user conditions
    Given I am logged in with "<user_type>" credentials
    When I search for an "<book_status>" book
    And I select the book from search results
    And I click the "Checkout" button
    And I confirm the checkout action
    Then I should see "<expected_message>"
    And the book status should change to "<new_status>"
    And the book should appear in my borrowed items list with correct due date
    
    Examples:
      | user_type           | book_status | expected_message                              | new_status    |
      | valid               | available   | Book checkout successful                      | Checked Out   |
      | reached limit       | available   | Maximum checkout limit reached                | Available     |
      | valid               | reserved    | This book is currently reserved by another user | Reserved     |
      | expired privileges  | available   | Your borrowing privileges have expired        | Available     |

  Scenario: Return a borrowed book before due date
    Given I am logged in with valid user credentials
    And I have at least one book checked out
    And the book's due date has not passed
    When I navigate to "My Borrowed Items" section
    And I select a checked out book
    And I click the "Return" button
    And I confirm the return action
    Then I should see a return confirmation message
    And the book status should change to "Available"
    And the book should be removed from my borrowed items list

  Scenario: Return an overdue book with late fee
    Given I am logged in with valid user credentials
    And I have at least one overdue book
    And the system date is after the book's due date
    When I navigate to "My Borrowed Items" section
    And I select an overdue book
    And I click the "Return" button
    And I confirm the return action
    Then I should see a return confirmation message with late fee information
    And the book status should change to "Available"
    And the book should be removed from my borrowed items list
    And I should see the correct late fee in my account based on days overdue

  Scenario: Renew a borrowed book before due date
    Given I am logged in with valid user credentials
    And I have at least one book eligible for renewal
    When I navigate to "My Borrowed Items" section
    And I select an eligible book
    And I click the "Renew" button
    And I confirm the renewal action
    Then I should see a renewal confirmation message
    And the book's due date should be extended according to library policy
    And the renewal count for the book should be incremented

  Scenario Outline: Attempt to renew books under different conditions
    Given I am logged in with valid user credentials
    And I have a book with "<renewal_status>" status
    When I navigate to "My Borrowed Items" section
    And I select the book
    And I click the "Renew" button
    Then I should see "<expected_message>"
    And the due date should "<date_action>"
    
    Examples:
      | renewal_status           | expected_message                     | date_action                |
      | eligible                 | Book renewed successfully            | be extended by 14 days     |
      | maximum renewals reached | Maximum renewals reached             | remain unchanged           |
      | overdue                  | Overdue books cannot be renewed      | remain unchanged           |
      | on hold by another user  | Book on hold and cannot be renewed   | remain unchanged           |

  Scenario: New user registration with valid information
    Given I am on the library registration page
    When I enter the following registration details:
      | Field             | Value                     |
      | Name              | John Smith                |
      | Address           | 123 Main St, Anytown      |
      | Email             | john.smith@example.com    |
      | Phone             | 555-123-4567              |
      | Username          | jsmith                    |
      | Password          | SecurePass123!            |
      | Confirm Password  | SecurePass123!            |
    And I accept the terms and conditions
    And I submit the registration form
    Then I should see a registration confirmation message
    And I should receive a confirmation email
    And I should be able to log in with my new credentials

  Scenario Outline: Register with invalid information
    Given I am on the library registration page
    When I enter invalid "<field>" with value "<value>"
    And I submit the registration form
    Then I should see an error message indicating "<error_message>"
    
    Examples:
      | field            | value              | error_message                              |
      | Email            | notanemail         | Please enter a valid email address         |
      | Password         | short              | Password must be at least 8 characters     |
      | Confirm Password | DifferentPass123!  | Passwords do not match                     |
      | Username         | ex                 | Username must be at least 3 characters     |
      | Phone            | abc123             | Please enter a valid phone number          |

  Scenario: Reserve a checked out book
    Given I am logged in with valid user credentials
    When I search for a book that is currently checked out
    And I select the book from search results
    And I click the "Reserve" button
    And I confirm the reservation
    Then I should see a reservation confirmation
    And the book should appear in my reservation list
    And I should be placed in the reservation queue for the book

  Scenario: View personalized book recommendations
    Given I am logged in with valid user credentials
    And I have previously borrowed books
    When I navigate to the "Recommended Books" section
    Then I should see book recommendations based on my borrowing history
    And each recommendation should include book details and availability status

  Scenario: Reset forgotten password
    Given I am on the login page
    When I click on the "Forgot Password" link
    And I enter my registered email address
    And I submit the password reset form
    Then I should receive a password reset link in my email
    When I click on the reset link
    And I enter a new password "NewSecurePass456!"
    And I confirm the new password "NewSecurePass456!"
    And I submit the password reset form
    Then I should see a password change confirmation
    And I should be able to log in with my new password

  Scenario: Update user profile information
    Given I am logged in with valid user credentials
    When I navigate to the "My Account" section
    And I click on the "Edit Profile" option
    And I update the following information:
      | Field     | New Value                  |
      | Phone     | 555-987-6543               |
      | Address   | 456 Oak Ave, New Town      |
      | Email     | updated.email@example.com  |
    And I save the changes
    Then I should see a profile update confirmation message
    And my profile should display the updated information

  Scenario: Submit a book review
    Given I am logged in with valid user credentials
    And I have previously borrowed a book
    When I navigate to the "My Borrowed History" section
    And I select a book from my history
    And I click on "Write a Review"
    And I enter a rating of 4 stars
    And I enter a review text "This was an excellent book with compelling characters."
    And I submit the review
    Then I should see a review submission confirmation
    And the review should appear on the book's details page

  Scenario Outline: Search for non-existent books
    Given I am on the library search page
    When I select "<search_parameter>" as the search parameter
    And I enter "<search_value>" in the search field
    And I click the "Search" button
    Then I should see a message indicating "No books found matching your search criteria"
    
    Examples:
      | search_parameter | search_value                 |
      | Title            | Nonexistent Book Title XYZ   |
      | Author           | Unknown Author 123           |
      | ISBN             | 000-0-000-00000-0            |

  Scenario: Attempt to check out a book with unpaid late fees
    Given I am logged in with valid user credentials
    And I have unpaid late fees on my account
    When I search for an available book
    And I select the book from search results
    And I click the "Checkout" button
    Then I should see a message indicating "Please pay outstanding fees before checking out new books"
    And the book status should remain as "Available"

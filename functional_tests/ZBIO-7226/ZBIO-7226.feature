Feature: Playwright Dashboard Functional Test Insights Testing
  As a user of Playwright dashboard
  I want to access and use the Functional Test Insights features
  So that I can analyze and manage test results effectively

  Background: 
    # UI Test Background
    Given I have a browser open
    And I have valid login credentials for the Playwright dashboard
    
    # API Test Background
    Given the API base URL is set to "https://playwright-dashboard-api.example.com"
    And the authorization header is set with token from environment variable "PLAYWRIGHT_AUTH_TOKEN"
    And the content type is "application/json"

  # UI Test Scenarios
  Scenario: Navigate to Insights View for Functional Tests
    Given I am logged in to the Playwright dashboard
    When I navigate to the test results section
    And I click on the "Insights" tab
    And I select the "Functional Tests" category from the filter dropdown
    Then I should see the Insights view for Functional tests
    And the page should display relevant metrics for functional tests
    And data visualizations should be visible

  Scenario: Verify Functional Test Data Display in Insights View
    Given I am on the Functional test Insights view
    When I examine the displayed metrics
    Then I should see pass/fail rates for functional tests
    And I should see test duration metrics
    And I should see a list of flaky tests if any exist
    And the data should match the actual functional test results

  Scenario: Test Filter Functionality in Functional Test Insights
    Given I am on the Functional test Insights view
    When I click on the filter dropdown
    Then I should see filter options including "Test Status", "Test Duration", and "Test Name"
    
    When I select "Test Status" filter
    And I choose "Failed" from the status options
    Then the displayed results should only show failed tests
    
    When I select "Test Duration" filter
    And I choose to view tests taking longer than 5 seconds
    Then the displayed results should only show tests with duration greater than 5 seconds

  Scenario: Compare Metrics Between Different Test Types
    Given I am on the Playwright Insights dashboard
    When I navigate to the comparison view
    And I select "Functional Tests" and "API Tests" for comparison
    Then I should see a comparative visualization of both test types
    And I should be able to compare pass rates between test types
    And I should be able to compare average duration between test types

  Scenario: Export Functional Test Insights Data
    Given I am on the Functional test Insights view
    When I click on the "Export" button
    Then I should see options for "CSV", "PDF", and "JSON" formats
    
    When I select "CSV" format
    And I click "Export"
    Then the file should download successfully
    And the CSV file should contain accurate functional test data
    
    When I select "PDF" format
    And I click "Export"
    Then the file should download successfully
    And the PDF file should display the same data as shown in the UI

  Scenario: Select Different Time Periods for Functional Test Insights
    Given I am on the Functional test Insights view
    When I locate the time period selector
    And I select "Last 7 Days" from the dropdown
    Then the insights data should refresh
    And only show functional test results from the past 7 days
    
    When I select "Last 30 Days" from the time period dropdown
    Then the insights data should refresh
    And I should see historical trends for the past 30 days
    
    When I select "Custom Range" from the time period dropdown
    And I set the date range from "2023-01-01" to "2023-01-31"
    Then the insights data should refresh
    And only show functional test results from January 2023

  Scenario: View Detailed Information for Individual Functional Tests
    Given I am on the Functional test Insights view
    When I click on a specific test named "Login Functionality Test"
    Then I should see a detailed view for that specific test
    And the detailed view should include test steps
    And the detailed view should show any captured screenshots
    And the detailed view should provide access to test videos
    And I should see console logs related to the test execution
    And any error messages should be clearly displayed if the test failed

  Scenario: Check User Preferences Persistence in Functional Test Insights
    Given I am logged in to the Playwright dashboard
    And I am on the Functional test Insights view
    When I apply a filter for "Failed" tests
    And I sort the results by "Execution Time" in descending order
    And I navigate away to another section of the dashboard
    And I return to the Functional test Insights view
    Then my filter for "Failed" tests should still be applied
    And the results should still be sorted by "Execution Time" in descending order
    
    When I log out from the dashboard
    And I log back in with the same credentials
    And I navigate to the Functional test Insights view
    Then my previous filter and sorting preferences should be preserved

  # API Test Scenarios
  Scenario: Retrieve All Functional Test Results via API
    When I send a GET request to "/api/tests/functional"
    Then the response status should be 200
    And the response body should be a JSON array
    And each test object should contain "id", "name", "status", and "duration" fields
    And the response should include pagination information

  Scenario: Filter Functional Tests by Status via API
    When I send a GET request to "/api/tests/functional?status=failed"
    Then the response status should be 200
    And the response body should be a JSON array
    And all test objects in the response should have "status" field equal to "failed"
    And the response should include the total count of failed tests

  Scenario: Retrieve Detailed Information for a Specific Functional Test via API
    When I send a GET request to "/api/tests/functional/TC-001"
    Then the response status should be 200
    And the response body should contain "id" field equal to "TC-001"
    And the response body should contain detailed test information including:
      | field         | type    |
      | name          | string  |
      | description   | string  |
      | status        | string  |
      | duration      | number  |
      | steps         | array   |
      | screenshots   | array   |
      | videos        | array   |
      | consoleOutput | string  |
      | errors        | array   |

  Scenario: Export Functional Test Results in Different Formats via API
    When I send a GET request to "/api/tests/functional/export?format=csv"
    Then the response status should be 200
    And the response content type should be "text/csv"
    And the response should contain valid CSV data for functional tests

    When I send a GET request to "/api/tests/functional/export?format=json"
    Then the response status should be 200
    And the response content type should be "application/json"
    And the response body should contain all functional test data

    When I send a GET request to "/api/tests/functional/export?format=pdf"
    Then the response status should be 200
    And the response content type should be "application/pdf"

  Scenario: Retrieve Comparison Data Between Test Types via API
    When I send a GET request to "/api/insights/comparison?types=functional,api"
    Then the response status should be 200
    And the response body should contain comparative metrics for both test types
    And the response should include the following comparison fields:
      | field                | type   |
      | totalTests           | object |
      | passRate             | object |
      | averageDuration      | object |
      | flakyTestPercentage  | object |
      | mostFrequentErrors   | object |

  Scenario: Update Functional Test Result Status via API
    Given the request body:
      """
      {
        "status": "ignored",
        "reason": "False positive due to test environment issue"
      }
      """
    When I send a PATCH request to "/api/tests/functional/TC-003"
    Then the response status should be 200
    And the response body should contain "status" field equal to "ignored"
    And the response body should contain "reason" field with the provided explanation

  Scenario: Retrieve Functional Test Insights for Specific Time Period via API
    When I send a GET request to "/api/insights/functional?startDate=2023-01-01&endDate=2023-01-31"
    Then the response status should be 200
    And the response body should contain test metrics for January 2023
    And the response should include daily breakdown of test results
    And all test records should have timestamps between "2023-01-01" and "2023-01-31"

  Scenario: Handle Invalid API Requests for Functional Test Insights
    When I send a GET request to "/api/tests/functional/invalid-id"
    Then the response status should be 404
    And the response body should contain "error" field with message "Test not found"
    
    When I send a GET request to "/api/insights/functional?startDate=invalid-date"
    Then the response status should be 400
    And the response body should contain "error" field with message "Invalid date format"
    
    When I send a GET request to "/api/tests/functional"
    And I do not include the authorization header
    Then the response status should be 401
    And the response body should contain "error" field with message "Unauthorized"

  Scenario: Check Real-time Updates of Functional Test Results via WebSocket API
    Given I connect to the WebSocket endpoint "/api/websocket/tests/functional"
    When a new functional test is executed on the system
    Then I should receive a WebSocket message containing the new test result
    And the message should include "id", "name", "status", and "timestamp" fields
    And the insights metrics should be updated accordingly

  Scenario: Batch Upload Functional Test Results via API
    Given the request body:
      """
      {
        "tests": [
          {
            "name": "Login Test",
            "status": "passed",
            "duration": 1.5,
            "steps": [
              {"name": "Navigate to login page", "status": "passed"},
              {"name": "Enter credentials", "status": "passed"},
              {"name": "Submit form", "status": "passed"},
              {"name": "Verify dashboard loaded", "status": "passed"}
            ]
          },
          {
            "name": "Registration Test",
            "status": "failed",
            "duration": 2.3,
            "steps": [
              {"name": "Navigate to registration page", "status": "passed"},
              {"name": "Fill registration form", "status": "passed"},
              {"name": "Submit form", "status": "passed"},
              {"name": "Verify confirmation email", "status": "failed", "error": "Email not received"}
            ]
          }
        ]
      }
      """
    When I send a POST request to "/api/tests/functional/batch"
    Then the response status should be 201
    And the response body should contain an array of created test IDs
    And the response should include a summary of processed tests

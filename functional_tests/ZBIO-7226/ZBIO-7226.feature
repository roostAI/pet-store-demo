Feature: Functional Test Insights Dashboard
  As a test engineer
  I want to access and interact with the Functional Test Insights dashboard
  So that I can analyze test results and make data-driven decisions

  Background:
    Given the testing platform is accessible
    And a user with appropriate permissions is logged in
    And the API base URL is set from environment variable 'API_BASE_URL'
    And the authorization header is set with token from 'AUTH_TOKEN'
    And the content type is 'application/json'
    And multiple functional tests have been executed previously

  # UI Test Scenarios
  Scenario: Access Insights View for Functional Tests
    Given I am on the test dashboard page
    When I click on the "Insights" tab
    And I select "Functional Tests" from the test type filter
    Then I should see the Insights view loaded successfully
    And I should see functional test results displayed
    And I should see metrics including pass/fail rates
    And I should see test execution time analytics

  Scenario: Filter Functional Test Results by Status
    Given I am on the Insights view for functional tests
    When I locate the filtering options
    And I apply a filter for "Passed" tests
    Then I should only see tests with "Passed" status
    And the metrics should update to reflect only passed tests
    When I apply a filter for "Failed" tests
    Then I should only see tests with "Failed" status
    And the metrics should update to reflect only failed tests

  Scenario: Filter Functional Test Results by Date Range
    Given I am on the Insights view for functional tests
    When I locate the date range filter
    And I select a start date of "01/01/2023"
    And I select an end date of "01/31/2023"
    And I apply the date filter
    Then I should only see tests executed between "01/01/2023" and "01/31/2023"
    And the metrics should update to reflect only tests within the date range

  Scenario: Sort Functional Test Results by Different Columns
    Given I am on the Insights view for functional tests
    When I click on the column header for "Test Name"
    Then the tests should be sorted alphabetically by name
    When I click on the column header for "Test Name" again
    Then the tests should be sorted in reverse alphabetical order
    When I click on the column header for "Duration"
    Then the tests should be sorted by execution time in ascending order
    When I click on the column header for "Duration" again
    Then the tests should be sorted by execution time in descending order
    When I click on the column header for "Status"
    Then the tests should be grouped by status

  Scenario: Download Test Reports in Different Formats
    Given I am on the Insights view for functional tests
    When I locate the "Export" button
    And I click on the "Export" button
    Then I should see options for different export formats
    When I select "PDF" format
    And I click the "Download" button
    Then a PDF report should be downloaded
    And the report should contain accurate test information
    When I click on the "Export" button again
    And I select "CSV" format
    And I click the "Download" button
    Then a CSV report should be downloaded
    And the report should contain accurate test information

  Scenario: View Detailed Information for a Specific Test
    Given I am on the Insights view for functional tests
    When I select a test named "Login Functionality Test"
    And I click on the test to view details
    Then I should see a detailed view for the selected test
    And I should see the test steps executed
    And I should see any screenshots captured during the test
    And I should see console logs for the test
    And I should see error messages if the test failed

  Scenario: Compare Historical Test Results
    Given I am on the Insights view for functional tests
    When I locate the comparison feature
    And I select "Last Week" as the first time period
    And I select "Current Week" as the second time period
    And I click the "Compare" button
    Then I should see a comparison of test results between the selected periods
    And I should see differences in pass/fail rates highlighted
    And I should see changes in execution times highlighted
    And I should see a trend visualization of test stability

  Scenario: Verify Mobile Responsive Layout
    Given I am on the Insights view for functional tests
    When I resize my browser window to mobile dimensions
    Then all elements should reposition for mobile view
    And all features should remain accessible
    And navigation elements should collapse into a menu
    And I should be able to scroll through test results
    When I tap on a test result
    Then I should see the test details optimized for mobile view

  Scenario: Verify Integration with Other Test Insights
    Given I am on the main Insights dashboard
    When I observe the dashboard layout
    Then I should see sections for "Unit Tests", "Integration Tests", "API Tests", and "Functional Tests"
    When I click on "Functional Tests" section
    Then I should be taken to the Functional Test Insights view
    When I navigate back to the main dashboard
    And I click on "API Tests" section
    Then I should be taken to the API Test Insights view
    And the navigation pattern should be consistent with the Functional Test section

  # API Test Scenarios
  Scenario: Retrieve Functional Test Results via API
    When I send a GET request to "/api/insights/functional-tests"
    Then the response status should be 200
    And the response body should contain a JSON array of test results
    And each test result should contain fields "id", "name", "status", "duration", and "executedAt"
    And the response should include pagination information

  Scenario: Filter Functional Test Results via API
    When I send a GET request to "/api/insights/functional-tests?status=passed"
    Then the response status should be 200
    And all test results in the response should have status "passed"
    When I send a GET request to "/api/insights/functional-tests?status=failed"
    Then the response status should be 200
    And all test results in the response should have status "failed"

  Scenario: Retrieve Test Results for a Specific Date Range via API
    When I send a GET request to "/api/insights/functional-tests?startDate=2023-01-01&endDate=2023-01-31"
    Then the response status should be 200
    And all test results should have "executedAt" dates between "2023-01-01" and "2023-01-31"
    And the response should include a count of total tests in the date range

  Scenario: Retrieve Detailed Information for a Specific Test via API
    When I send a GET request to "/api/insights/functional-tests/TC-001"
    Then the response status should be 200
    And the response body should contain detailed information about the test
    And the response should include "steps", "screenshots", "logs", and "errorMessages" fields
    And the test ID in the response should be "TC-001"

  Scenario: Generate and Download Test Reports via API
    Given the request body:
      """
      {
        "format": "pdf",
        "filters": {
          "status": "all",
          "startDate": "2023-01-01",
          "endDate": "2023-01-31"
        }
      }
      """
    When I send a POST request to "/api/insights/functional-tests/reports"
    Then the response status should be 200
    And the response should contain a URL to download the report
    When I send a GET request to the report URL
    Then the response should be a PDF file
    And the PDF should contain accurate test information

  Scenario: Compare Test Results Between Two Time Periods via API
    Given the request body:
      """
      {
        "period1": {
          "startDate": "2023-01-01",
          "endDate": "2023-01-07"
        },
        "period2": {
          "startDate": "2023-01-08",
          "endDate": "2023-01-14"
        }
      }
      """
    When I send a POST request to "/api/insights/functional-tests/compare"
    Then the response status should be 200
    And the response should contain comparison data for both periods
    And the response should include "passRateDifference", "durationChanges", and "stabilityScore" fields

  Scenario: Handle Invalid Date Range in API Request
    Given the request body:
      """
      {
        "period1": {
          "startDate": "2023-01-31",
          "endDate": "2023-01-01"
        },
        "period2": {
          "startDate": "2023-02-01",
          "endDate": "2023-02-28"
        }
      }
      """
    When I send a POST request to "/api/insights/functional-tests/compare"
    Then the response status should be 400
    And the response should contain an error message about invalid date range
    And the error message should specify which period has the invalid range

  Scenario: Verify Data Accuracy via API
    Given a set of functional tests with known results have been executed
    When I send a GET request to "/api/insights/functional-tests/summary"
    Then the response status should be 200
    And the response "passCount" should match the number of passed tests
    And the response "failCount" should match the number of failed tests
    And the response "totalCount" should match the total number of tests
    And the response "averageDuration" should be calculated correctly

  Scenario: Retrieve Test Metrics Over Time via API
    When I send a GET request to "/api/insights/functional-tests/metrics?timeframe=last30days&interval=daily"
    Then the response status should be 200
    And the response should contain an array of daily metrics
    And each daily metric should include "date", "passCount", "failCount", and "averageDuration"
    And the array should contain data for the last 30 days

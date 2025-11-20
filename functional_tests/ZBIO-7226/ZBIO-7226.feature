Feature: Functional Test Insights Dashboard Testing
  As a QA engineer or developer
  I want to access and use the Functional Test Insights Dashboard
  So that I can analyze and monitor test execution results effectively

  Background:
    # For API tests
    Given the API base URL is set from environment variable 'API_BASE_URL'
    And the authorization header is set with token from 'AUTH_TOKEN'
    And the content type is 'application/json'
    
    # For UI tests
    Given the testing environment for Playwright is properly set up
    And a valid user account with appropriate permissions exists

  # UI Test Scenarios
  Scenario: Navigate to Insights View for Functional Tests
    Given I am logged into the testing application dashboard
    When I click on the "Functional Tests" section in the navigation menu
    And I click on the "Insights" option
    Then I should see the Insights view for Functional tests
    And the page should display relevant metrics and data visualizations

  Scenario: Verify Content Elements of Functional Test Insights View
    Given I am on the Functional Tests Insights view
    Then I should see test execution metrics
    And I should see pass/fail statistics
    And I should see execution time data
    And I should see trend visualizations
    And I should see error categorization information
    And all data visualization components should be properly loaded

  Scenario: Filter Functional Test Insights by Date Range
    Given I am on the Functional Tests Insights view
    When I click on the date filter control
    And I select start date as "2023-01-01"
    And I select end date as "2023-03-31"
    And I apply the filter
    Then the insights data should update to show only results from Q1 2023
    And the charts and statistics should reflect this filtered time period

  Scenario: Filter Functional Test Insights by Test Status
    Given I am on the Functional Tests Insights view
    When I select "Failed" from the test status filter dropdown
    Then the insights data should update to show only failed tests
    And the total test count should match the number of failed tests
    And all displayed test cases should have a failed status

  Scenario: Clear All Applied Filters in Functional Test Insights
    Given I am on the Functional Tests Insights view
    And I have applied multiple filters to the data
    When I click on the "Clear All Filters" button
    Then all filters should be reset to default values
    And the complete unfiltered dataset should be displayed
    And all visualizations should update to reflect the complete dataset

  Scenario: Export Functional Test Insights Data as CSV
    Given I am on the Functional Tests Insights view
    When I click on the "Export" button
    And I select "CSV" format from the export options
    And I click "Download"
    Then a CSV file should be downloaded
    And the file should contain all currently displayed insights data
    And the data in the file should match what is shown in the UI

  Scenario: Export Functional Test Insights Data as PDF
    Given I am on the Functional Tests Insights view
    When I click on the "Export" button
    And I select "PDF" format from the export options
    And I click "Download"
    Then a PDF file should be downloaded
    And the file should contain visualizations and metrics from the insights view

  Scenario: Compare Current Test Results with Historical Data
    Given I am on the Functional Tests Insights view
    When I navigate to the "Comparison" tab
    And I select the current test run
    And I select a previous test run from "last month"
    Then I should see a side-by-side comparison of both test runs
    And I should see comparative metrics for pass/fail ratios
    And I should see comparative metrics for execution times
    And I should see comparative metrics for most frequent failures

  Scenario: Verify Keyboard Navigation Support for Accessibility
    Given I am on the Functional Tests Insights view
    When I press the "Tab" key multiple times
    Then I should be able to navigate through all interactive elements
    And each interactive element should show a focus indicator when selected
    And I should be able to activate buttons with the "Enter" key
    And I should be able to use dropdown menus with keyboard controls

  Scenario: Verify Screen Reader Compatibility for Accessibility
    Given I am on the Functional Tests Insights view
    And I have a screen reader enabled
    When I navigate through the page elements
    Then all charts and visualizations should have appropriate ARIA labels
    And all tables should have proper row and column headers
    And all form controls should have associated label text
    And no content should be inaccessible to the screen reader

  Scenario: Test Responsive Behavior on Tablet Viewport
    Given I am on the Functional Tests Insights view
    When I resize the browser to tablet dimensions "768x1024"
    Then all dashboard components should rearrange appropriately
    And all visualizations should be properly scaled
    And no content should be cut off or inaccessible
    And navigation elements should adapt to the smaller screen size

  # API Test Scenarios
  Scenario: Retrieve Functional Test Insights Summary via API
    When I send a GET request to '/api/insights/functional/summary'
    Then the response status should be 200
    And the response body should contain the following fields:
      | totalTests       |
      | passedTests      |
      | failedTests      |
      | skippedTests     |
      | averageRunTime   |
      | lastExecutionDate |
    And the 'totalTests' value should be a positive integer
    And the 'passedTests' plus 'failedTests' plus 'skippedTests' should equal 'totalTests'

  Scenario: Retrieve Functional Test Results List via API
    When I send a GET request to '/api/insights/functional/tests'
    Then the response status should be 200
    And the response body should be a JSON array
    And each array item should contain the following fields:
      | testId           |
      | testName         |
      | status           |
      | executionTime    |
      | lastExecuted     |
    And the response should include pagination information

  Scenario: Retrieve Functional Test Results with Filtering by Status
    When I send a GET request to '/api/insights/functional/tests?status=failed'
    Then the response status should be 200
    And the response body should be a JSON array
    And each item in the array should have the 'status' field equal to 'failed'

  Scenario: Retrieve Functional Test Results with Filtering by Date Range
    When I send a GET request to '/api/insights/functional/tests?startDate=2023-01-01&endDate=2023-03-31'
    Then the response status should be 200
    And the response body should be a JSON array
    And each item in the array should have 'lastExecuted' between '2023-01-01' and '2023-03-31'

  Scenario: Retrieve Detailed Information for a Specific Test
    When I send a GET request to '/api/insights/functional/tests/TC-001'
    Then the response status should be 200
    And the response body should contain detailed information about test 'TC-001'
    And the response should include test execution history
    And the response should include any failure details if applicable

  Scenario: Export Functional Test Insights Data via API
    When I send a POST request to '/api/insights/functional/export'
    With request body:
      """
      {
        "format": "csv",
        "filters": {
          "status": "all",
          "startDate": "2023-01-01",
          "endDate": "2023-12-31"
        }
      }
      """
    Then the response status should be 200
    And the response should contain export data in CSV format
    And the content-type header should be 'text/csv'
    And the data should match the filtered criteria

  Scenario: Update Test Case Result Status via API
    Given the request body:
      """
      {
        "status": "ignored",
        "reason": "False positive due to environment issue"
      }
      """
    When I send a PATCH request to '/api/insights/functional/tests/TC-003'
    Then the response status should be 200
    And the response body should contain the updated test information
    And the 'status' field should be equal to 'ignored'

  Scenario: Create a New Test Case via API
    Given the request body:
      """
      {
        "testId": "TC-NEW-001",
        "title": "New Functional Test Case",
        "description": "Testing API creation of test case",
        "type": "functional",
        "tags": ["api", "smoke"]
      }
      """
    When I send a POST request to '/api/insights/functional/tests'
    Then the response status should be 201
    And the response body should contain the newly created test case
    And the 'testId' field should be equal to 'TC-NEW-001'

  Scenario: Delete a Test Case via API
    When I send a DELETE request to '/api/insights/functional/tests/TC-010'
    Then the response status should be 204
    And subsequent GET requests to '/api/insights/functional/tests/TC-010' should return 404

  Scenario: Handle Invalid API Authentication
    Given the authorization header is set with an invalid token
    When I send a GET request to '/api/insights/functional/summary'
    Then the response status should be 401
    And the response body should contain an error message about invalid authentication

  Scenario: Handle Non-Existent API Resource
    When I send a GET request to '/api/insights/functional/nonexistent'
    Then the response status should be 404
    And the response body should contain an error message indicating the resource was not found

  Scenario: Retrieve Functional Test Performance Metrics via API
    When I send a GET request to '/api/insights/functional/performance'
    Then the response status should be 200
    And the response body should include load time metrics
    And the response body should include browser compatibility data
    And the response body should include performance comparison against baselines

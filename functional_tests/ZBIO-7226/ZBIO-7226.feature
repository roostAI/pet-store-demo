Feature: Playwright Functional Tests Insights View

  Background:
    Given I have access to the application with admin permissions
    And the Playwright test framework is already installed and configured

  @api
  Scenario: Enable Insights View for Playwright Functional Tests through API
    Given the API base URL is set to "/api/config/insights"
    When I send a GET request to "/api/config/insights/status"
    Then the response status should be 200
    And the response should contain "functionalTestsEnabled" with value "false"
    When I send a PUT request to "/api/config/insights/config" with payload:
    """
    {
      "functionalTestsEnabled": true,
      "dataCollectionLevel": "Complete",
      "retentionPeriodDays": 30
    }
    """
    Then the response status should be 200
    And the response should contain "status" with value "success"
    And the response should contain "message" with value "Configuration updated successfully"
    When I send a GET request to "/api/config/insights/status"
    Then the response status should be 200
    And the response should contain "functionalTestsEnabled" with value "true"
    And the response should contain "dataCollectionLevel" with value "Complete"
    And the response should contain "retentionPeriodDays" with value "30"

  @ui
  Scenario: Enable Insights View for Playwright Functional Tests through UI
    Given I am on the "test configuration dashboard" page
    When I navigate to the "Insights configuration" section
    Then I should see the "Enable Insights for Functional Tests" toggle is set to "OFF"
    When I toggle the "Enable Insights for Functional Tests" option to "ON"
    And I select "Complete" from the "Data Collection Level" dropdown
    And I set the "Retention Period" to "30" days
    And I click the "Save Configuration" button
    Then I should see a success message "Configuration saved successfully"
    When I run a sample functional test suite
    And I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    Then I should see test results from the sample run in the Insights dashboard
    And I should see the "Functional Tests" category is available

  @ui
  Scenario Outline: Verify Functional Test Results Display in Insights View
    Given Insights view is enabled for Playwright functional tests
    And a test suite with "<outcome>" tests has been executed
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    Then I should see the test summary section shows correct counts for all test statuses
    When I expand a "<outcome>" test case
    Then I should see all test steps are displayed correctly
    And I should see "<expected_artifacts>" are available for the test
    And I should see the test metadata is correctly displayed

    Examples:
      | outcome | expected_artifacts                     |
      | passed  | screenshots, console logs              |
      | failed  | screenshots, console logs, error trace |
      | skipped | status reason                          |

  @api
  Scenario: Retrieve Functional Test Results through API
    Given the API base URL is set to "/api/insights"
    And a functional test suite has been executed with mixed results
    When I send a GET request to "/api/insights/functional/summary"
    Then the response status should be 200
    And the response should contain "totalTests"
    And the response should contain "passedTests"
    And the response should contain "failedTests"
    And the response should contain "skippedTests"
    When I send a GET request to "/api/insights/functional/tests" with query parameters:
    """
    {
      "status": "failed",
      "limit": 10,
      "offset": 0
    }
    """
    Then the response status should be 200
    And the response should be an array with at least 1 item
    And each array item should contain "testName"
    And each array item should contain "status" with value "failed"
    And each array item should contain "duration"
    And each array item should contain "errorMessage"

  @ui
  Scenario Outline: Test Filtering and Sorting in Functional Test Insights
    Given Insights view is enabled for functional tests
    And multiple test runs with diverse test characteristics exist
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    And I apply a filter by "<filter_type>" with value "<filter_value>"
    Then I should see only tests matching the filter criteria
    And I should see the test count updates correctly
    When I sort the results by "<sort_field>" in "<sort_direction>" order
    Then I should see the tests are sorted correctly
    When I save the current filter combination as preset "<preset_name>"
    And I clear all filters
    Then I should see all tests are displayed again
    When I load the saved "<preset_name>" preset
    Then I should see the correct filters are applied

    Examples:
      | filter_type | filter_value | sort_field  | sort_direction | preset_name       |
      | status      | failed       | execution   | descending     | Failed Tests      |
      | browser     | Chrome       | duration    | descending     | Slow Chrome Tests |
      | duration    | >5s          | name        | ascending      | Long Tests        |
      | tag         | critical-path| last run    | descending     | Critical Tests    |

  @api
  Scenario: Filter and Sort Functional Test Results via API
    Given the API base URL is set to "/api/insights"
    And multiple test runs with diverse test characteristics exist
    When I send a GET request to "/api/insights/functional/tests" with query parameters:
    """
    {
      "status": "failed",
      "browser": "Chrome",
      "minDuration": 5000,
      "sort": "duration",
      "order": "desc",
      "limit": 20,
      "offset": 0
    }
    """
    Then the response status should be 200
    And the response should be an array
    And each array item should contain "status" with value "failed"
    And each array item should contain "browser" with value "Chrome"
    And each array item should contain "duration" with value >= 5000
    And the array should be sorted by "duration" in descending order

  @ui
  Scenario Outline: Cross-Browser Insights Comparison for Functional Tests
    Given Insights view is enabled for functional tests
    And the same test suite has been executed on multiple browsers
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    And I navigate to the "Browser Comparison" section
    And I select "<browser1>" and "<browser2>" for comparison
    Then I should see summary statistics showing pass/fail rates across browsers
    And I should see tests that passed in "<browser1>" but failed in "<browser2>" highlighted
    And I should see screenshots comparison between browsers for failed tests
    And I should see performance comparison chart showing test duration differences
    When I export the comparison report to PDF format
    Then I should receive a PDF containing all relevant comparison data

    Examples:
      | browser1 | browser2 |
      | Chrome   | Firefox  |
      | Chrome   | Safari   |
      | Firefox  | Safari   |
      | Chrome   | Edge     |

  @api
  Scenario: Retrieve Cross-Browser Comparison Data via API
    Given the API base URL is set to "/api/insights"
    And the same test suite has been executed on multiple browsers
    When I send a GET request to "/api/insights/functional/browser-comparison" with query parameters:
    """
    {
      "browsers": ["Chrome", "Firefox", "Safari"],
      "testRunIds": ["run123", "run124", "run125"]
    }
    """
    Then the response status should be 200
    And the response should contain "comparisonSummary"
    And the response should contain "inconsistentTests"
    And the response should contain "performanceComparison"
    And the "inconsistentTests" array should identify tests with different outcomes across browsers

  @ui
  Scenario Outline: Handling and Visualization of Flaky Tests in Insights View
    Given Insights view is enabled for functional tests
    And the test runner is configured to retry failed tests 3 times
    And a test suite containing known flaky tests has been executed multiple times
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    Then I should see flaky tests are flagged with a distinct indicator
    When I open the details of a flaky test "<test_name>"
    Then I should see its execution history with pass/fail pattern across attempts
    And I should see the flakiness percentage is calculated correctly
    When I examine the "Flakiness Report" section
    Then I should see tests ranked by flakiness percentage
    And I should see system recommendations for stabilizing flaky tests

    Examples:
      | test_name                      |
      | login_with_remember_me_option  |
      | search_with_special_characters |
      | submit_form_with_large_payload |
      | load_dashboard_with_many_widgets |

  @api
  Scenario: Retrieve Flaky Test Information via API
    Given the API base URL is set to "/api/insights"
    And a test suite containing known flaky tests has been executed multiple times
    When I send a GET request to "/api/insights/functional/flaky-tests"
    Then the response status should be 200
    And the response should be an array of flaky tests
    And each array item should contain "testName"
    And each array item should contain "flakinessRate"
    And each array item should contain "executionHistory"
    And each array item should contain "recommendations"
    When I send a GET request to "/api/insights/functional/flaky-tests/details" with query parameters:
    """
    {
      "testId": "login_with_remember_me_option"
    }
    """
    Then the response status should be 200
    And the response should contain "executionHistory" with at least 3 items
    And the response should contain "flakinessRate" with a value between 0 and 100
    And the response should contain "possibleCauses"
    And the response should contain "recommendations"

  @ui
  Scenario: Historical Trend Analysis for Functional Tests in Insights View
    Given Insights view is enabled for functional tests
    And historical data from at least 10 test runs over a period of time exists
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    And I navigate to the "Trends" section
    And I select a date range covering the last 10 test runs
    Then I should see a line chart showing pass/fail rates over time
    And I should see the performance trend chart showing average test duration changes
    And I should see the top 5 most frequently failing tests from the trend data
    When I apply a filter to focus on a specific test case
    Then I should see its individual trend data
    When I export the trend report to CSV format
    Then I should receive a CSV file containing all relevant trend data
    When I use the comparison tool to compare current results with a baseline run
    Then I should see significant changes in test behavior highlighted

  @api
  Scenario: Retrieve Historical Trend Data via API
    Given the API base URL is set to "/api/insights"
    And historical data from at least 10 test runs over a period of time exists
    When I send a GET request to "/api/insights/functional/trends" with query parameters:
    """
    {
      "startDate": "2023-01-01",
      "endDate": "2023-01-31",
      "interval": "day"
    }
    """
    Then the response status should be 200
    And the response should contain "trendData" as an array
    And each item in "trendData" should contain "date"
    And each item in "trendData" should contain "passRate"
    And each item in "trendData" should contain "averageDuration"
    And the response should contain "topFailingTests" as an array
    When I send a GET request to "/api/insights/functional/trends/test" with query parameters:
    """
    {
      "testId": "login_test",
      "startDate": "2023-01-01",
      "endDate": "2023-01-31"
    }
    """
    Then the response status should be 200
    And the response should contain "testHistory" as an array
    And each item in "testHistory" should contain "date"
    And each item in "testHistory" should contain "status"
    And each item in "testHistory" should contain "duration"

  @ui
  Scenario Outline: Detailed Test Step Analysis in Functional Test Insights
    Given Insights view is enabled for functional tests with step-level data collection
    And a functional test suite with detailed steps has been executed
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    And I open a test case with multiple steps
    Then I should see each test step listed in sequence with its description
    And I should see step duration information for each step
    And I should see screenshots associated with specific steps
    And I should see network requests captured during each step
    And I should see console logs segmented by step
    When I examine a "<test_outcome>" test
    Then I should see <failure_visibility>

    Examples:
      | test_outcome | failure_visibility                                     |
      | passed       | all steps marked as passed                             |
      | failed       | the specific failing step highlighted with error details |
      | flaky        | inconsistent steps highlighted across executions       |

  @api
  Scenario: Retrieve Test Step Details via API
    Given the API base URL is set to "/api/insights"
    And a functional test suite with detailed steps has been executed
    When I send a GET request to "/api/insights/functional/tests/steps" with query parameters:
    """
    {
      "testId": "checkout_process_test"
    }
    """
    Then the response status should be 200
    And the response should contain "steps" as an array
    And each item in "steps" should contain "stepName"
    And each item in "steps" should contain "duration"
    And each item in "steps" should contain "status"
    And each item in "steps" should contain "screenshotUrl" if available
    And each item in "steps" should contain "networkRequests" if available
    And each item in "steps" should contain "consoleLogs" if available
    And if the test failed, the failing step should contain "errorDetails"

  @ui
  Scenario: Network Request Analysis in Functional Test Insights
    Given Insights view is enabled for functional tests with network monitoring
    And a functional test suite that generates diverse network activities has been executed
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    And I open a test with multiple network requests
    And I navigate to the "Network" tab
    Then I should see all API calls made during the test listed with their endpoints
    And I should see request and response headers are captured and viewable
    And I should see request and response bodies are viewable
    And I should see network timing information is displayed
    And I should see failed requests have error details properly captured
    When I filter network requests by "status code" with value "4xx"
    Then I should see only requests with 4xx status codes
    When I filter network requests by "domain" with value "api.example.com"
    Then I should see only requests to that domain

  @api
  Scenario: Retrieve Network Request Data via API
    Given the API base URL is set to "/api/insights"
    And a functional test suite that generates diverse network activities has been executed
    When I send a GET request to "/api/insights/functional/tests/network" with query parameters:
    """
    {
      "testId": "api_integration_test",
      "statusCode": "all",
      "domain": "all",
      "limit": 50,
      "offset": 0
    }
    """
    Then the response status should be 200
    And the response should contain "requests" as an array
    And each item in "requests" should contain "url"
    And each item in "requests" should contain "method"
    And each item in "requests" should contain "statusCode"
    And each item in "requests" should contain "requestHeaders"
    And each item in "requests" should contain "responseHeaders"
    And each item in "requests" should contain "timing"
    And failed requests should contain "errorDetails"
    When I send a GET request to "/api/insights/functional/tests/network" with query parameters:
    """
    {
      "testId": "api_integration_test",
      "statusCode": "4xx",
      "domain": "api.example.com"
    }
    """
    Then the response status should be 200
    And the response should contain only requests with 4xx status codes to "api.example.com"

  @ui
  Scenario Outline: Performance Metrics Visualization in Functional Test Insights
    Given Insights view is enabled for functional tests with performance metrics collection
    And a functional test suite with performance data collection enabled has been executed
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    And I open a test case
    And I navigate to the "Performance" tab
    Then I should see core web vitals displayed
    And I should see page load timing metrics with a waterfall chart
    And I should see CPU utilization graph during test execution
    And I should see memory consumption chart
    And I should see resource loading times
    When I compare performance metrics against "<comparison_type>"
    Then I should see metrics that exceed thresholds highlighted

    Examples:
      | comparison_type |
      | defined thresholds |
      | previous run       |
      | 7-day average      |
      | target benchmark   |

  @api
  Scenario: Retrieve Performance Metrics via API
    Given the API base URL is set to "/api/insights"
    And a functional test suite with performance data collection enabled has been executed
    When I send a GET request to "/api/insights/functional/tests/performance" with query parameters:
    """
    {
      "testId": "product_page_load_test"
    }
    """
    Then the response status should be 200
    And the response should contain "coreWebVitals"
    And the response should contain "pageLoadMetrics"
    And the response should contain "resourceLoadingTimes"
    And the response should contain "cpuUtilization"
    And the response should contain "memoryConsumption"
    And the response should contain "comparisonToThresholds" if thresholds are defined
    And the response should contain "comparisonToPrevious" if previous data exists
    And the response should contain "recommendations" for performance improvements

  @ui
  Scenario: Integration with Existing Test Insights Types
    Given Insights view is enabled for all test types
    And completed test runs exist for all test types
    When I navigate to the "Insights dashboard" page
    Then I should see "Functional Tests" appears alongside existing test type options
    When I select "All Test Types" to view a combined dashboard
    Then I should see functional tests are correctly categorized
    When I apply filters that span across test types by feature "User Authentication"
    Then I should see relevant tests from all types including functional tests
    When I navigate to the test coverage view
    Then I should see functional tests contribute to coverage metrics
    When I examine the unified timeline view
    Then I should see executions across all test types in chronological order
    When I search for "login" in the global search
    Then I should see relevant results from functional tests

  @api
  Scenario: Access Combined Test Type Data via API
    Given the API base URL is set to "/api/insights"
    And completed test runs exist for all test types
    When I send a GET request to "/api/insights/test-types"
    Then the response status should be 200
    And the response should contain "functionalTests" with value "true"
    When I send a GET request to "/api/insights/combined" with query parameters:
    """
    {
      "feature": "User Authentication",
      "includeTypes": ["unit", "integration", "api", "functional"]
    }
    """
    Then the response status should be 200
    And the response should contain tests from all requested types
    And the functional tests should be properly categorized
    When I send a GET request to "/api/insights/search" with query parameters:
    """
    {
      "query": "login",
      "includeTypes": ["unit", "integration", "api", "functional"]
    }
    """
    Then the response status should be 200
    And the response should include matching tests from functional test type

  @ui
  Scenario Outline: Data Export for Functional Test Insights
    Given Insights view is enabled for functional tests
    And completed test runs with comprehensive insights data exist
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    And I apply filters if needed
    And I click on the "Export" option
    And I select "<export_format>" format
    And I initiate the export
    Then I should receive a file in "<export_format>" format
    And the exported file should contain <expected_content>

    Examples:
      | export_format | expected_content                                        |
      | CSV           | all relevant columns with correct data                   |
      | JSON          | structured data matching the expected schema             |
      | PDF           | visualizations and data in readable format               |
      | HTML          | interactive report with charts and detailed information  |

  @api
  Scenario Outline: Access Insights Data via API for External Integration
    Given the API base URL is set to "/api/insights"
    And appropriate API access credentials are configured
    When I send a GET request to "<endpoint>" with appropriate authentication
    And I include query parameters as needed:
    """
    <parameters>
    """
    Then the response status should be 200
    And the response should contain data in the expected format
    And <additional_verification>

    Examples:
      | endpoint                             | parameters                                          | additional_verification                                 |
      | /api/insights/functional/summary     | {"period": "last30days"}                            | summary statistics should match dashboard values        |
      | /api/insights/functional/tests       | {"status": "failed", "limit": 50}                   | pagination should work correctly for large result sets  |
      | /api/insights/functional/trends      | {"startDate": "2023-01-01", "endDate": "2023-01-31"}| trend data should be chronologically ordered            |
      | /api/insights/functional/flaky-tests | {}                                                  | flakiness rates should be accurately calculated         |

  @ui
  Scenario: Verify Accessibility of Functional Test Insights View
    Given Insights view is enabled for functional tests
    And completed test runs exist
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    Then automated accessibility scanning should show no critical violations
    And all interactive elements should be keyboard accessible
    And keyboard navigation should follow a logical focus order
    And all images and charts should have appropriate alt text
    And color contrast ratios should meet WCAG AA requirements
    And screen reader should correctly announce all content
    And error messages should be communicated through multiple channels
    And dynamic content changes should be properly announced

  @ui
  Scenario Outline: Permissions and Access Control for Functional Test Insights
    Given Insights view is enabled for functional tests
    And completed test runs with insights data exist
    And I am logged in as a user with "<role>" role
    When I navigate to the "Insights dashboard" page
    And I select "Functional Tests" from the test type filter
    Then I should <view_action> the insights data
    And I should <config_action> configurations
    And I should <permission_action> user permissions

    Examples:
      | role    | view_action    | config_action           | permission_action         |
      | Viewer  | be able to view | not be able to modify   | not be able to manage     |
      | Editor  | be able to view | be able to modify       | not be able to manage     |
      | Admin   | be able to view | be able to modify       | be able to manage         |

  @api
  Scenario Outline: API Access Control for Functional Test Insights
    Given the API base URL is set to "/api/insights"
    And I have API credentials with "<role>" permissions
    When I send a <method> request to "<endpoint>" with appropriate authentication
    Then the response status should be <status_code>
    And <response_verification>

    Examples:
      | role    | method | endpoint                          | status_code | response_verification                              |
      | Viewer  | GET    | /api/insights/functional/tests    | 200         | the response should contain the requested data     |
      | Viewer  | PUT    | /api/insights/config/functional   | 403         | the response should indicate permission denied     |
      | Editor  | GET    | /api/insights/functional/tests    | 200         | the response should contain the requested data     |
      | Editor  | PUT    | /api/insights/config/functional   | 200         | the configuration should be updated successfully   |
      | Editor  | PUT    | /api/insights/permissions         | 403         | the response should indicate permission denied     |
      | Admin   | GET    | /api/insights/functional/tests    | 200         | the response should contain the requested data     |
      | Admin   | PUT    | /api/insights/permissions         | 200         | the permissions should be updated successfully     |

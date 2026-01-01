Feature: Playwright Functional Test Insights View

  Background:
    Given I have admin permissions to access the application
    And Playwright test framework is already installed and configured
    And there are existing functional tests available for execution

  @config
  Scenario: Enable insights view for Playwright functional tests
    Given I am on the test configuration dashboard
    When I locate the Insights configuration section
    And I verify that insights for functional tests is currently disabled
    And I toggle the "Enable Insights for Functional Tests" option to ON
    And I select "Complete" from the data collection level dropdown
    And I set the retention period to "30 days"
    And I save the configuration changes
    And I run a sample functional test suite
    And I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    Then I should see a confirmation message indicating configuration was saved
    And the test results from the sample run should be visible under Functional Tests category

  @results-display
  Scenario: Verify functional test results display in insights view
    Given insights view is enabled for Playwright functional tests
    And a comprehensive test suite has been executed with various outcomes
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    Then the test summary section should show correct counts for passed, failed, and skipped tests
    And test duration information should be displayed accurately
    When I expand a passed test case
    Then all steps should be displayed correctly
    When I expand a failed test case
    Then error messages and stack traces should be visible
    And screenshots taken during test execution should be properly linked and viewable
    And console logs should be captured and displayed for each test
    And test metadata should correctly show browser, viewport, and environment information

  @filtering
  Scenario Outline: Filter and sort functional test results using different criteria
    Given insights view is enabled for functional tests
    And multiple test runs with diverse characteristics exist
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I apply a filter to show only "<filter_type>" tests
    Then only tests matching the "<filter_type>" criteria should be displayed
    When I clear all filters
    And I apply filters for "<browser>" browser with duration longer than <duration> seconds
    And I sort results by <sort_criteria> in <sort_direction> order
    Then the filtered results should only show tests for "<browser>" with duration longer than <duration> seconds
    And the results should be sorted by <sort_criteria> in <sort_direction> order

    Examples:
      | filter_type | browser | duration | sort_criteria  | sort_direction |
      | failed      | Chrome  | 5        | execution_time | descending     |
      | passed      | Firefox | 3        | name           | ascending      |
      | skipped     | Safari  | 2        | status         | ascending      |

  @filter-preset
  Scenario: Save and reapply filter combination presets
    Given insights view is enabled for functional tests
    And multiple test runs with diverse characteristics exist
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I apply a filter to show tests for "Chrome" browser
    And I add another filter to show tests with duration longer than 5 seconds
    And I sort the results by execution time in descending order
    And I save the current filter combination as a preset named "Slow Chrome Tests"
    And I clear all filters
    Then all tests should be displayed again
    When I load the saved "Slow Chrome Tests" preset
    Then only tests for "Chrome" browser with duration longer than 5 seconds should be displayed
    And the results should be sorted by execution time in descending order

  @browser-comparison
  Scenario: Compare functional test results across different browsers
    Given insights view is enabled for functional tests
    And the same test suite has been executed on multiple browsers
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I navigate to the "Browser Comparison" section
    And I select test runs from "Chrome", "Firefox", and "Safari" for comparison
    Then I should see summary statistics showing pass/fail rates across browsers
    And tests with inconsistent results across browsers should be highlighted
    When I select a test that failed in only one browser
    Then I should be able to compare the screenshots across different browsers
    And I should see a performance comparison chart showing test duration differences
    When I export the comparison report to PDF format
    Then the exported PDF should contain all relevant comparison data
    And browser-specific console errors should be highlighted in the comparison view

  @flaky-tests
  Scenario: Identify and analyze flaky tests in insights view
    Given insights view is enabled for functional tests
    And test suite contains known flaky tests
    And the test runner is configured to retry failed tests 3 times
    When I execute the test suite containing flaky tests
    And I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    Then flaky tests should be flagged with a distinct indicator
    When I open the details of a flaky test
    Then I should see its execution history
    And the pass/fail pattern across attempts should be displayed
    When I examine the "Flakiness Report" section
    Then I should see tests ranked by flakiness percentage
    And screenshots from different execution attempts should be available for comparison
    And system recommendations for stabilizing flaky tests should be provided

  @trend-analysis
  Scenario: Analyze historical trends for functional tests
    Given insights view is enabled for functional tests
    And historical data from at least 10 test runs is available
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I navigate to the "Trends" section
    And I select a date range covering the last 10 test runs
    Then I should see a line chart showing pass/fail rates over time
    And I should see a performance trend chart showing average test duration changes
    And the top 5 most frequently failing tests should be identified
    When I apply a filter to focus on a specific test case
    Then I should see its individual trend data
    When I export the trend report to CSV format
    Then the exported CSV should contain all relevant trend data
    When I use the comparison tool to compare current results with a baseline run
    Then significant changes in test behavior should be highlighted

  @test-step-analysis
  Scenario: View detailed test step information in insights view
    Given insights view is enabled for functional tests with step-level data collection
    And a functional test suite with detailed steps has been executed
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I open a test case with multiple steps
    Then each test step should be listed in sequence with its description
    And step duration information should be displayed for each step
    And screenshots associated with specific steps should be accessible
    And network requests should be grouped by the step during which they occurred
    And console logs should be segmented by step
    And for a failed test, the failure should be correctly attributed to the specific step

  @network-analysis
  Scenario: Analyze network requests in functional test insights
    Given insights view is enabled for functional tests with network monitoring
    And a test suite that generates diverse network activities has been executed
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I open a test with multiple network requests
    And I navigate to the "Network" tab
    Then all API calls made during the test should be listed with their endpoints
    And request and response headers should be viewable
    And request and response bodies should be complete and correctly formatted
    And network timing information should be displayed
    And for failed requests, error details should be properly captured
    And I should be able to filter network data by request type, status code, or domain

  @performance-metrics
  Scenario: View performance metrics in functional test insights
    Given insights view is enabled for functional tests with performance metrics collection
    And a functional test suite with performance data collection has been executed
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I open a test case and navigate to the "Performance" tab
    Then core web vitals (LCP, FID, CLS) should be captured and displayed
    And page load timing metrics should be shown with a waterfall chart
    And CPU utilization graph during test execution should be visible
    And memory consumption chart should be displayed for leak detection
    And resource loading times should be detailed
    And performance metrics should be compared against defined thresholds or baselines

  @integration
  Scenario: Verify integration with existing test insights types
    Given insights view is enabled for all test types
    And completed test runs for all test types exist
    When I navigate to the Insights dashboard
    Then "Functional Tests" should appear alongside existing test type options
    When I select "All Test Types" to view a combined dashboard
    Then functional tests should be correctly categorized and not mixed with other test types
    When I apply filters that span across test types
    Then cross-test type statistics should be calculated correctly
    When I navigate to the test coverage view
    Then functional tests should contribute to coverage metrics
    When I examine the unified timeline view
    Then it should show executions across all test types
    When I use the comparison tool to compare results between different test types
    Then I should see relevant differences for the same feature
    When I use global search functionality
    Then results should be returned from all test types including functional

  @data-export
  Scenario Outline: Export insights data in different formats
    Given insights view is enabled for functional tests
    And completed test runs with comprehensive insights data exist
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I click on the "Export" option
    And I select "<format>" as the export format
    Then the data should be successfully exported in "<format>" format
    And the exported file should contain all relevant data

    Examples:
      | format |
      | CSV    |
      | JSON   |
      | PDF    |

  @accessibility
  Scenario: Verify accessibility compliance of insights view
    Given insights view is enabled for functional tests
    When I navigate to the Insights dashboard
    And I select "Functional Tests" from the test type filter
    And I run automated accessibility scanning tools
    Then no critical accessibility violations should be detected
    And all interactive elements should be keyboard accessible
    And focus order should be logical and intuitive
    And all visual elements should have appropriate text alternatives
    And color contrast ratios should meet WCAG AA requirements
    When I test the insights view with a screen reader
    Then all content should be announced properly
    And error states should be clearly communicated through multiple channels
    And dynamic content changes should be properly announced

  @permissions
  Scenario Outline: Verify role-based access control for insights view
    Given insights view is enabled for functional tests
    And completed test runs with insights data exist
    And I am logged in as a user with "<role>" role
    When I navigate to the Insights dashboard
    Then I should see the Insights dashboard with "<access_level>" access
    And I should <permission_action> able to modify configurations

    Examples:
      | role      | access_level | permission_action |
      | Viewer    | read-only    | not be            |
      | Editor    | edit         | be                |
      | Admin     | full         | be                |

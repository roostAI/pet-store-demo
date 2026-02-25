Feature: Playwright Functional Test Insights Dashboard

  Background:
    Given the user is logged in with appropriate permissions
    And Playwright Functional test data exists in the system

  @navigation @ui
  Scenario: Access and navigate to the Playwright Functional Test Insights view
    Given the user is on the application home page
    When the user navigates to the "Testing" section
    And the user clicks on the "Insights" tab
    And the user selects "Functional Tests" from the test type filter dropdown
    Then the Insights view should load successfully for Functional tests
    And the navigation breadcrumbs should show the correct path to Functional Test Insights
    And the Functional test type should be highlighted in the filter
    And Playwright test results should be displayed in the insights view

  @datavisualization @ui
  Scenario: Verify data visualization components for Playwright Test Insights
    Given the user is on the Functional Test Insights view
    When the user observes the data visualization components
    Then all visualization components should render properly
    And test count metrics should match actual test executions
    And status distribution should correctly display pass/fail/skip counts
    And performance metrics should show accurate test execution times
    And interactive elements should display detailed information on hover

  @filter @search @ui
  Scenario Outline: Filter and search within Playwright Test Insights
    Given the user is on the Functional Test Insights view
    When the user applies filter for "<filter_type>" with value "<filter_value>"
    Then the visualization should update to show only matching tests
    And the filter count should display accurately

    Examples:
      | filter_type | filter_value |
      | test status | passed       |
      | test status | failed       |
      | duration    | >5s          |
      | date range  | last 7 days  |

  @filter @search @ui
  Scenario: Search for specific tests in Playwright Test Insights
    Given the user is on the Functional Test Insights view
    When the user searches for tests containing "login"
    Then only tests with "login" in their name should be displayed
    And the search result count should be accurate
    When the user clears all filters
    Then all test results should be displayed again

  @comparison @ui
  Scenario: Compare Playwright Functional tests with other test types
    Given the user is on the Insights dashboard
    When the user activates the cross-comparison view
    And the user selects "Playwright Functional" tests for comparison
    And the user selects "Unit" tests for comparison
    Then the comparative visualization should show both test types side by side
    And metrics should be properly normalized for comparison
    When the user adds "API" tests to the comparison
    Then all three test types should be visible in the comparison
    And the visualization should adapt to accommodate multiple test types

  @export @ui
  Scenario Outline: Export data from Playwright Test Insights in different formats
    Given the user is on the Functional Test Insights view
    And test data is displayed in the view
    When the user clicks the export button
    And the user selects "<format>" format
    And the user downloads the exported file
    Then the downloaded file should be in "<format>" format
    And the file should contain all data currently displayed in the UI

    Examples:
      | format |
      | CSV    |
      | PDF    |
      | JSON   |

  @configuration @ui
  Scenario: Configure the Insights view settings for Playwright Tests
    Given the user is on the Functional Test Insights view
    When the user clicks on "Settings" or "Configure" option
    And the user changes the visualization type from "bar chart" to "pie chart"
    And the user adjusts the time range to "last 30 days"
    And the user configures custom metrics to display on the dashboard
    And the user applies the configuration changes
    Then the visualization should update to pie chart type
    And the time range should be limited to the last 30 days
    And the custom metrics should be displayed accurately
    When the user saves the configuration as "My Custom View"
    And the user navigates away and returns to the Insights view
    Then the "My Custom View" configuration should be applied

  @refresh @ui
  Scenario: Verify real-time updates and refresh mechanisms
    Given the user is on the Functional Test Insights view
    And the user notes the current metrics
    When new Playwright tests are executed in the system
    And the user clicks the refresh button
    Then the updated metrics should reflect the newly executed tests
    And the timestamp of last update should change
    When the user enables auto-refresh with 30-second interval
    And new tests are executed in the system
    Then the view should automatically update within 30 seconds
    And the updated metrics should include the new test results

  @errorhandling @ui
  Scenario Outline: Handle error conditions in Playwright Test Insights
    Given the user is on the Functional Test Insights view
    When "<error_condition>" occurs
    Then an appropriate error message should be displayed
    And the system should provide recovery options
    And the UI should remain in a usable state

    Examples:
      | error_condition                           |
      | attempt to load non-existent test suite   |
      | network interruption during data loading  |
      | viewing tests with incomplete data        |
      | filtering with invalid criteria           |

  @accessibility @ui
  Scenario: Verify accessibility compliance of Insights view
    Given the user is on the Functional Test Insights view
    When the user navigates through all interactive elements using keyboard
    Then focus indicators should be visible on all interactive elements
    And keyboard navigation should work for all components
    When a screen reader is used to access the page
    Then all information should be correctly announced by the screen reader
    And all images and visualizations should have appropriate alt text
    And all form controls should have associated labels
    When the page is zoomed to 200%
    Then all content should remain usable and visible

  @permissions @ui
  Scenario Outline: Verify permission controls for Playwright Test Insights
    Given the user is logged in with "<role>" permissions
    When the user attempts to access the Functional Test Insights view
    Then the system should "<access_result>"
    And if access is granted, the user should "<feature_availability>"

    Examples:
      | role            | access_result      | feature_availability                                   |
      | admin           | grant full access  | be able to view and modify all aspects of Insights     |
      | read-only user  | grant view access  | be able to view data but not modify configurations     |
      | no permissions  | deny access        | see an appropriate permission error                    |
      | partial access  | grant partial view | only see features they're authorized to use            |

  @trends @ui
  Scenario: Analyze trends in Playwright test results over time
    Given the user is on the Functional Test Insights view
    When the user selects the "Trends" or "Historical Analysis" view
    And the user configures the time range to show the last 7 days
    Then the trend visualization should display changes in test results over time
    And the data points should accurately reflect actual test execution history
    When the user switches to 30-day view
    Then the trend visualization should update with appropriate data granularity
    And the user should be able to compare with baseline period

  @failureanalysis @ui
  Scenario: Analyze failures and identify root causes for Playwright Tests
    Given the user is on the Functional Test Insights view
    When the user filters to show only failed tests
    And the user groups failures by error type
    And the user selects a specific failure group for detailed analysis
    Then the error details, screenshots, and execution logs should be displayed
    And the user should be able to view historical occurrences of the same error
    And the user should be able to access the test video recording if available
    When the user uses the root cause suggestion feature
    Then relevant possible causes should be displayed
    And the user should be able to flag the failure with an appropriate category

  @performance @ui
  Scenario: Visualize performance metrics for Playwright Functional Tests
    Given the user is on the Functional Test Insights view
    When the user navigates to the "Performance Metrics" section
    Then test execution time metrics should be displayed accurately
    And page load time visualizations should be available
    And resource usage metrics should show CPU, memory, and network utilization
    When the user sorts tests by execution duration
    Then tests should be ordered from slowest to fastest
    And the user should be able to compare performance across different browsers
    And the user should be able to view performance trends over time

  @customdashboard @ui
  Scenario: Create custom dashboard for Playwright Test Insights
    Given the user is on the Functional Test Insights view
    When the user selects the "Create Custom Dashboard" option
    And the user adds a "Test Status Summary" widget to the dashboard
    And the user adds a "Trend Chart" widget to the dashboard
    And the user configures each widget with specific data sources
    And the user arranges the layout of widgets on the dashboard
    And the user saves the dashboard as "Playwright Performance Overview"
    Then the dashboard should be saved successfully
    And the dashboard should be available for future sessions
    When the user shares the dashboard with another user
    Then the specified user should have access to the shared dashboard
    When the user sets the custom dashboard as default view
    Then the custom dashboard should appear on initial load in future sessions

  @responsiveness @ui
  Scenario Outline: Verify mobile responsiveness of Insights view
    Given the user accesses the Functional Test Insights view on a "<device>" device
    When the user views the page in "<orientation>" orientation
    Then the layout should adapt appropriately to the screen size
    And all critical information should be accessible without horizontal scrolling
    And visualization components should resize appropriately
    And touch interactions should work correctly with all interactive elements

    Examples:
      | device        | orientation |
      | small phone   | portrait    |
      | small phone   | landscape   |
      | tablet        | portrait    |
      | tablet        | landscape   |

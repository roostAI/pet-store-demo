Feature: Insights View Integration for Playwright Functional Tests

  Background:
    Given the Insights dashboard is operational
    And Playwright test framework is set up and running
    And sample functional tests with various statuses have been executed
    And I have admin user permissions to access the Insights dashboard

  @ui
  Scenario: Verify functional test results display in Insights view
    When I navigate to the Insights dashboard
    And I click on the Functional Test category in the navigation
    Then the functional test section should be visible
    And the displayed test results should match actual execution results
    And all test statuses should be correctly color-coded
    And the UI presentation should be consistent with other test types

  @ui
  Scenario Outline: Verify browser compatibility for Insights view
    Given I am using <browser> browser
    When I navigate to the Insights dashboard
    And I click on the Functional Test category in the navigation
    Then the functional test section should load properly
    And all test results should be displayed correctly

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |

  @ui
  Scenario Outline: Test filtering capabilities in Functional Test Insights view
    Given I am on the Insights dashboard
    And I have clicked on the Functional Test category
    When I filter results by "<filter_type>" with value "<filter_value>"
    Then only test results matching "<filter_value>" should be displayed
    And clearing the filter should restore all test results

    Examples:
      | filter_type    | filter_value |
      | test status    | passed       |
      | test status    | failed       |
      | test status    | skipped      |
      | test duration  | shortest     |
      | test duration  | longest      |
      | test name      | login        |
      | test name      | checkout     |

  @ui
  Scenario: Verify pagination in Functional Test Insights view
    Given I am on the Insights dashboard Functional Test section
    And there are more than 20 test results available
    When I navigate to page 2 of the results
    Then the next set of test results should be displayed
    And when I navigate back to page 1
    Then the first set of test results should be displayed

  @ui
  Scenario Outline: Navigate between different test types in Insights view
    Given I am on the Insights dashboard
    When I select the "<original_view>" test view
    And I apply some filters
    And I switch to "<new_view>" test view
    And I apply different filters
    And I switch back to "<original_view>" test view
    Then the "<original_view>" view should maintain its previous filter state
    And the active view should be clearly highlighted in navigation

    Examples:
      | original_view | new_view     |
      | Functional    | Unit         |
      | Functional    | Integration  |
      | Functional    | API          |
      | Unit          | Functional   |
      | Integration   | Functional   |
      | API           | Functional   |

  @ui
  Scenario Outline: View detailed test information for different test statuses
    Given I am on the Functional Test section in the Insights dashboard
    When I select a test with "<status>" status
    Then the detailed view should show all test steps
    And the test details should include name, duration, and status
    And screenshots should be displayed when available
    And logs should be formatted and readable
    And "<status>" related information should be appropriately displayed

    Examples:
      | status |
      | passed |
      | failed |
      | skipped|

  @ui
  Scenario: Verify screenshot interaction in detailed test view
    Given I am on the Functional Test section in the Insights dashboard
    When I select a test with screenshots
    And I click on a screenshot thumbnail
    Then the screenshot should expand to full size
    And when I click outside the expanded screenshot
    Then the screenshot should return to thumbnail size

  @ui
  Scenario Outline: Export functional test results in different formats
    Given I am on the Functional Test section in the Insights dashboard
    And I have applied some filters to create a specific result subset
    When I click the Export button
    And I select "<format>" format
    Then the export should complete successfully
    And the exported file should match the currently filtered view
    And the exported file should have appropriate formatting for "<format>"

    Examples:
      | format |
      | CSV    |
      | JSON   |
      | HTML   |
      | PDF    |

  @ui
  Scenario: Verify real-time test status updates
    Given I am on the Insights dashboard
    And a Playwright functional test suite execution has been initiated
    When I navigate to the Functional Test section
    Then tests should appear as they begin execution
    And status indicators should update in real-time
    And summary statistics should update dynamically
    And when all tests complete
    Then the final results should match actual execution outcomes

  @ui
  Scenario Outline: View trend analysis for different time periods
    Given I am on the Functional Test section in the Insights dashboard
    When I click on the Trends tab
    And I select "<time_range>" as the time range
    Then the trend visualization should display historical test pass/fail rates
    And hovering over data points should show detailed information
    And clicking on a trend point should navigate to that test run details

    Examples:
      | time_range |
      | Last Day   |
      | Last Week  |
      | Last Month |

  @ui
  Scenario: Verify error pattern recognition functionality
    Given I am on the Functional Test section in the Insights dashboard
    When I navigate to the Error Analysis view
    Then common error types should be categorized
    And selecting an error category should show related tests
    And error details should include stack traces and context
    And similar errors should be grouped together
    And error trends over time should be displayed

  @ui
  Scenario: Create and manage custom dashboard for functional tests
    Given I am on the Insights dashboard
    When I select the Functional Test section
    And I click on "Create Custom Dashboard" option
    And I add a test summary widget
    And I add a trend chart widget
    And I add a recent failures widget
    And I arrange the dashboard layout
    And I save the dashboard as "My Functional Dashboard"
    And I navigate away from the dashboard
    And I return to the saved dashboard list
    Then "My Functional Dashboard" should be available
    And clicking on it should load my saved configuration
    And all widgets should display accurate data

  @ui
  Scenario Outline: Compare test results across different environments
    Given I am on the Functional Test section in the Insights dashboard
    When I select the Environment Comparison view
    And I select environments "<env1>" and "<env2>" to compare
    Then the comparison visualization should show differences in test results
    And tests with different outcomes should be highlighted
    And summary statistics should show pass/fail rates by environment

    Examples:
      | env1       | env2         |
      | Development| Staging      |
      | Staging    | Production   |
      | Production | Development  |

  @ui
  Scenario: Verify test execution timeline visualization
    Given I am on the Functional Test section in the Insights dashboard
    When I click on the "Execution Timeline" view
    Then the timeline should display all test executions
    And test block lengths should represent actual durations
    And parallel test executions should be on separate lanes
    And hovering over blocks should show precise timing information
    And the timeline should allow adjusting to different time ranges

  @ui
  Scenario: Identify and analyze flaky tests
    Given I am on the Functional Test section in the Insights dashboard
    When I click on the "Flakiness Analysis" view
    Then flaky tests should be identified based on inconsistent results
    And each test should have a flakiness score
    And selecting a flaky test should show detailed analysis
    And the test execution history should show pass/fail patterns
    And recommendations for reducing flakiness should be provided

  @ui
  Scenario Outline: Analyze test performance metrics
    Given I am on the Functional Test section in the Insights dashboard
    When I click on the "Performance Analysis" view
    And I select a test to view detailed performance breakdown
    Then execution times should be broken down by test step
    And resource utilization data should be graphed
    And performance bottlenecks should be highlighted
    And historical performance trends should be displayed for "<time_period>"

    Examples:
      | time_period |
      | Last Week   |
      | Last Month  |
      | Last Quarter|

  @ui
  Scenario Outline: Compare test results across different browsers
    Given I am on the Functional Test section in the Insights dashboard
    When I click on the "Browser Comparison" view
    Then the matrix should show test results across all browsers
    And tests with inconsistent results across browsers should be highlighted
    And selecting a browser-specific failure for "<browser>" should show detailed information
    And browser-specific error messages should be displayed

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  @ui
  Scenario Outline: Verify user permission controls
    Given I am logged in as a user with "<permission_level>" permissions
    When I navigate to the Insights dashboard
    Then access to the Functional Test section should be "<access_status>"
    And ability to modify dashboards should be "<modification_status>"
    And ability to export data should be "<export_status>"

    Examples:
      | permission_level | access_status | modification_status | export_status |
      | admin            | granted       | allowed            | allowed       |
      | standard         | granted       | allowed            | allowed       |
      | read-only        | granted       | denied             | allowed       |
      | none             | denied        | denied             | denied        |

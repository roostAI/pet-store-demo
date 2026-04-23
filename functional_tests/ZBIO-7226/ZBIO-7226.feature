Feature: Functional Test Results in Insights Dashboard
  As a QA engineer or developer
  I want to view and interact with functional test results in the Insights dashboard
  So that I can analyze test outcomes and make informed decisions

  Background:
    Given I am logged into the test management system
    And I have access to the Insights dashboard

  @smoke @ui
  Scenario: Verify presence of Functional Tests section in Insights dashboard
    When I navigate to the test insights dashboard
    Then I should see a "Functional Tests" section in the UI
    And the Functional Tests section should be displayed alongside other test types
    And the UI structure should be consistent with existing test types display

  @ui
  Scenario Outline: Verify proper rendering of functional test visualization components
    When I navigate to the test insights dashboard
    And I click on the "Functional Tests" section
    Then I should see "<visualizationComponent>" for functional test results
    And the component should render without visual defects

    Examples:
      | visualizationComponent |
      | Summary charts         |
      | Pass/Fail ratio graph  |
      | Test execution table   |
      | Duration distribution  |
      | Trend analysis chart   |

  @ui @integration
  Scenario: Verify data integration accuracy between test results and insights view
    Given multiple functional tests have been executed with known outcomes
    When I navigate to the Insights dashboard
    And I view the functional test results section
    Then the displayed results should match the actual test execution results
    And test counts should match the executed tests
    And pass/fail ratios should be calculated correctly
    And all metrics should accurately reflect the test execution data

  @ui
  Scenario Outline: Verify filtering functionality for functional test results
    When I navigate to the Insights dashboard
    And I select the functional tests view
    And I apply a filter for "<filterType>" with value "<filterValue>"
    Then only test results matching the "<filterType>" with value "<filterValue>" should be displayed
    And the UI should indicate that a filter is active

    Examples:
      | filterType  | filterValue |
      | Status      | Pass        |
      | Status      | Fail        |
      | Status      | Skip        |
      | Duration    | Fast        |
      | Duration    | Slow        |
      | Test Name   | Login       |
      | Test Suite  | Regression  |
      | Category    | API         |
      | Execute Date| Today       |

  @ui
  Scenario Outline: Verify sorting functionality for functional test results
    When I navigate to the Insights dashboard
    And I select the functional tests view
    And I sort results by "<sortOption>" in "<sortOrder>" order
    Then the test results should be displayed in "<sortOrder>" order by "<sortOption>"
    And the UI should indicate the active sort order

    Examples:
      | sortOption     | sortOrder  |
      | Test Name      | Ascending  |
      | Test Name      | Descending |
      | Duration       | Ascending  |
      | Duration       | Descending |
      | Execution Date | Ascending  |
      | Execution Date | Descending |
      | Pass Rate      | Ascending  |
      | Pass Rate      | Descending |

  @ui
  Scenario: Verify multiple filters can be applied simultaneously
    When I navigate to the Insights dashboard
    And I select the functional tests view
    And I apply a filter for "Status" with value "Fail"
    And I apply a filter for "Duration" with value "Slow"
    Then only test results that are "Fail" status and "Slow" duration should be displayed
    And the UI should indicate that multiple filters are active
    And I should be able to clear all filters
    And all test results should be displayed after clearing filters

  @ui @integration
  Scenario: Verify cross-test type comparison functionality
    When I navigate to the Insights dashboard
    And I navigate to the test type comparison view
    Then I should see comparison charts for all test types including functional tests
    And I should be able to compare metrics across test types
    And functional tests should be represented alongside other test types
    And toggling between test types should maintain context where appropriate

  @ui @performance
  Scenario Outline: Verify performance with different functional test dataset sizes
    Given a dataset of "<size>" functional test results is loaded
    When I navigate to the Insights dashboard
    And I select the functional tests view
    Then the page should load within "<expectedLoadTime>" seconds
    And UI interactions should remain responsive
    And all visualizations should render correctly
    And no UI freezing or crashes should occur

    Examples:
      | size        | expectedLoadTime |
      | Small       | 1                |
      | Medium      | 2                |
      | Large       | 3                |
      | Very Large  | 5                |

  @ui @real-time
  Scenario: Verify real-time data updates for functional test results
    Given I have the Insights dashboard open
    When new functional tests are executed in a separate process
    And I wait for the automatic refresh or click the manual refresh button
    Then the new test results should appear in the Insights view
    And the data should refresh without requiring a full page reload
    And timestamps should update to reflect the latest data
    And visualizations should incorporate the new data points

  @ui @error-handling
  Scenario Outline: Verify error handling in functional test insights view
    Given the functional test insights view is configured to encounter "<errorType>"
    When I navigate to the Insights dashboard
    And I select the functional tests view
    Then an appropriate error message for "<errorType>" should be displayed
    And the UI should remain stable without breaking the layout
    And a retry or recovery option should be available where appropriate

    Examples:
      | errorType           |
      | Network failure     |
      | Empty dataset       |
      | Malformed data      |
      | Server error        |
      | Authentication issue|

  @ui @accessibility
  Scenario Outline: Verify accessibility compliance of visualization components
    When I navigate to the Insights dashboard
    And I select the functional tests view
    Then the "<component>" should meet WCAG 2.1 AA standards
    And the "<component>" should have appropriate color contrast
    And the "<component>" should be keyboard navigable
    And the "<component>" should have proper ARIA attributes
    And the "<component>" should be readable by screen readers

    Examples:
      | component            |
      | Summary charts       |
      | Test execution table |
      | Filter controls      |
      | Sort controls        |
      | Pagination controls  |
      | Export buttons       |

  @ui @export
  Scenario Outline: Verify export functionality for functional test insights
    When I navigate to the Insights dashboard
    And I select the functional tests view
    And I export the data in "<format>" format
    Then a valid file in "<format>" format should be downloaded
    And the exported data should accurately reflect what's displayed in the UI
    And filters and sorting should be preserved in exported data

    Examples:
      | format |
      | CSV    |
      | PDF    |
      | PNG    |
      | JSON   |
      | Excel  |

  @ui @customization
  Scenario: Verify custom dashboard creation for functional test results
    When I navigate to the Insights dashboard
    And I access the custom dashboard creation interface
    And I add widgets specific to functional test results
    And I configure each widget with specific metrics
    And I save the dashboard with a unique name
    Then I should be able to access my saved custom dashboard later
    And the dashboard should display the selected metrics correctly
    And I should be able to modify the existing dashboard
    And changes to the dashboard should persist between sessions

  @ui
  Scenario Outline: Verify functional test categorization and tagging in insights view
    When I navigate to the Insights dashboard
    And I select the functional tests view
    And I filter by tag "<tagType>"
    Then only tests with tag "<tagType>" should be displayed
    And tag statistics should be accurately displayed in summary views

    Examples:
      | tagType              |
      | Performance-related  |
      | UI components        |
      | API interactions     |
      | Data validation      |
      | Authentication       |

  @ui @trending
  Scenario Outline: Verify historical trend analysis for functional tests
    When I navigate to the Insights dashboard
    And I select the functional tests view
    And I select the time range "<timeRange>"
    Then historical trend visualizations should display correctly
    And trend data for key metrics should be visible
    And time range selectors should modify the displayed data appropriately
    And hover information should provide details for specific time points

    Examples:
      | timeRange       |
      | Last 7 days     |
      | Last 30 days    |
      | Last quarter    |
      | Custom range    |
      | Week-over-week  |
      | Month-over-month|

  @ui @notifications
  Scenario: Verify notification configuration for functional test insights
    When I navigate to the Insights dashboard
    And I access the notification configuration section
    And I create an alert for "pass rate drops below 90%"
    And I configure delivery via "email"
    Then the alert should be saved successfully
    And when the alert condition is triggered
    Then a notification should be delivered through the configured channel
    And the notification should contain relevant information about the trigger

  @ui @root-cause
  Scenario: Verify root cause analysis tools for failed functional tests
    When I navigate to the Insights dashboard
    And I select the functional tests view
    And I filter by status "Failed"
    And I select a specific failed test to analyze
    Then I should see detailed failure information
    And diagnostic information should be accessible
    And similar failures should be correctly grouped or linked
    And historical failure data for the same test should be accessible

  @ui @environment
  Scenario Outline: Verify environment impact analysis on functional tests
    When I navigate to the Insights dashboard
    And I select the environment analysis section for functional tests
    And I compare results across environment "<environmentType>"
    Then test results should be correctly segmented by environment
    And environment-specific failures should be highlighted
    And performance differences across environments should be visualized

    Examples:
      | environmentType |
      | Development     |
      | Staging         |
      | Production      |
      | Browser         |
      | Operating System|

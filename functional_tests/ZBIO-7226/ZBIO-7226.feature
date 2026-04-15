Feature: Functional Tests Insights View
  As a test engineer or QA manager
  I want to access and interact with the Functional Tests Insights view
  So that I can analyze test results, identify trends, and make data-driven decisions

  Background:
    Given the user is logged into the application
    And the user has permissions to access test insights

  @smoke @navigation
  Scenario: Navigate to Functional Tests Insights view
    Given the user is on the main dashboard page
    When the user clicks on the "Insights" navigation item
    And the user selects "Functional Tests" from the test type options
    Then the Insights view for Functional tests should load successfully
    And the page title should indicate "Functional Test Insights"
    And all UI components should be visible including metrics dashboard, charts, and filters
    And no error messages should be displayed

  @data-integrity @high-priority
  Scenario Outline: Verify data accuracy in Functional Tests Insights view
    Given the user has navigated to the Functional Tests Insights view
    When the user identifies the "<metric_type>" metric displayed on the dashboard
    And the user navigates to the raw data source page
    Then the value in the Insights view should match the source data
    And the data presentation should match the pattern used in other test Insights views

    Examples:
      | metric_type      |
      | pass rate        |
      | failure rate     |
      | test duration    |
      | execution count  |
      | flaky test count |

  @visualization
  Scenario: Verify chart visualization accuracy
    Given the user has navigated to the Functional Tests Insights view
    When the user examines all charts and graphs on the page
    Then each chart should accurately represent the underlying data
    And color coding should be consistent
    And test history trends should accurately reflect changes over time

  @filtering @sorting
  Scenario Outline: Test filtering capabilities with different criteria
    Given the user has navigated to the Functional Tests Insights view
    When the user applies a filter for "<filter_type>" with value "<filter_value>"
    Then only data matching the filter criteria should be displayed
    And the filter operation should complete within 1 second

    Examples:
      | filter_type  | filter_value     |
      | test status  | Failed           |
      | test status  | Passed           |
      | date range   | Last 7 days      |
      | date range   | Last 30 days     |
      | test suite   | Regression       |
      | test suite   | Smoke            |
      | test duration| > 5 minutes      |
      | test duration| < 1 minute       |

  @sorting @user-interaction
  Scenario Outline: Test sorting functionality on different columns
    Given the user has navigated to the Functional Tests Insights view
    When the user sorts the data by "<column>" in "<direction>" order
    Then the data should be reordered according to the selected column and direction
    And the sorting operation should complete within 1 second

    Examples:
      | column        | direction  |
      | test name     | ascending  |
      | test name     | descending |
      | execution time| ascending  |
      | execution time| descending |
      | status        | ascending  |
      | status        | descending |
      | date executed | ascending  |
      | date executed | descending |

  @filtering @multiple-filters
  Scenario: Apply multiple filters simultaneously
    Given the user has navigated to the Functional Tests Insights view
    When the user applies the following filters:
      | Filter Type   | Filter Value   |
      | test status   | Failed         |
      | date range    | Last 7 days    |
      | test duration | > 1 minute     |
    Then only data matching all filter criteria should be displayed
    And clearing filters should restore all data

  @consistency @cross-view
  Scenario Outline: Compare consistency across different test type insights views
    Given the user has navigated to the "<view_type>" Tests Insights view
    When the user notes the layout, available filters, charts, and metrics
    And the user navigates to the Functional Tests Insights view
    Then the layout structure should be consistent with the previous view
    And common features should behave the same way
    And style, typography, and color scheme should be consistent

    Examples:
      | view_type    |
      | Unit         |
      | Integration  |
      | API          |

  @error-handling @edge-cases
  Scenario Outline: Validate error handling for various edge cases
    Given the user has navigated to the Functional Tests Insights view
    When the system encounters the "<edge_case>" condition
    Then an appropriate "<message_type>" message should be displayed
    And the UI should remain functional and stable

    Examples:
      | edge_case                          | message_type       |
      | no functional test data            | information        |
      | filters with no matching results   | information        |
      | network interruption               | error              |
      | extremely large dataset            | loading indicator  |
      | tests with incomplete metadata     | warning            |

  @performance @large-dataset
  Scenario Outline: Verify performance with large datasets
    Given the user has navigated to the Functional Tests Insights view
    And the system contains at least 1000 functional test records
    When the user performs "<operation_type>" operation
    Then the operation should complete within "<threshold>" seconds
    And no UI freezing, lagging, or browser warnings should occur

    Examples:
      | operation_type        | threshold |
      | initial page load     | 3         |
      | filter application    | 1         |
      | sorting data          | 1         |
      | exporting data        | 2         |
      | pagination navigation | 1         |
      | complex filtering     | 2         |

  @data-export
  Scenario Outline: Test data export in different formats
    Given the user has navigated to the Functional Tests Insights view
    When the user clicks the export button
    And selects "<format>" format export
    Then the download should initiate successfully
    And the exported file should contain all displayed data in the correct format
    And the content should match what is displayed in the UI

    Examples:
      | format |
      | CSV    |
      | PDF    |
      | Excel  |
      | JSON   |

  @drill-down @navigation
  Scenario: Navigate from summary metrics to detailed test results
    Given the user has navigated to the Functional Tests Insights view
    When the user clicks on a summary metric for failed tests
    Then the view should filter to show only failed tests
    When the user selects an individual test from the list
    Then the test details panel should open
    And all test details should be displayed correctly including steps, screenshots, and logs
    And navigation breadcrumbs should allow returning to previous views

  @cross-browser @compatibility
  Scenario Outline: Verify cross-browser compatibility
    Given the user accesses the Functional Tests Insights view in "<browser>"
    When the user performs basic operations of filtering, sorting, and exporting
    Then the layout and appearance should be consistent across browsers
    And all functionality should work correctly without browser-specific issues

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  @custom-dashboard @personalization
  Scenario: Create and save custom dashboard
    Given the user has navigated to the Functional Tests Insights view
    When the user clicks the "Create Custom Dashboard" option
    And selects multiple metrics and charts to add
    And arranges them in a custom layout
    And saves the dashboard as "My Custom Dashboard"
    And navigates away and back to saved dashboards
    Then the "My Custom Dashboard" should be available in the saved dashboards list
    And loading it should restore the exact configuration
    And the user should be able to modify and save changes to the dashboard

  @responsive-design @mobile
  Scenario Outline: Verify mobile responsiveness
    Given the user accesses the application on a "<device_type>" device or emulator
    When the user navigates to the Functional Tests Insights view
    Then the layout should adapt appropriately to the screen size
    And all important metrics and charts should be visible without horizontal scrolling
    And touch controls should work properly for all interactive elements
    And the layout should adjust when switching between portrait and landscape

    Examples:
      | device_type         |
      | smartphone          |
      | tablet              |
      | small laptop        |

  @real-time @updates
  Scenario: Verify updates when new test results become available
    Given the user has navigated to the Functional Tests Insights view
    And the current metrics and results are noted
    When new functional test executions complete in the system
    Then the Insights view should update or indicate that new results are available
    And after refreshing, all charts, graphs, and metrics should reflect the newly added test results

  @accessibility @WCAG
  Scenario Outline: Verify accessibility compliance
    Given the user has navigated to the Functional Tests Insights view
    And "<assistive_technology>" is enabled
    When the user navigates through the Insights view using only keyboard controls
    Then all elements should be properly announced by screen readers
    And all interactive elements should be operable using keyboard only
    And color contrast should meet WCAG AA standards
    And focus indicators should be clearly visible during keyboard navigation

    Examples:
      | assistive_technology |
      | NVDA screen reader   |
      | JAWS screen reader   |
      | VoiceOver           |
      | keyboard navigation  |

  @security @permissions
  Scenario Outline: Verify permission-based access control
    Given a user with "<permission_level>" permission level
    When the user logs in to the application
    And navigates to the Functional Tests Insights view
    Then the user should have access to "<visible_features>"
    And attempting restricted actions should result in appropriate error messages

    Examples:
      | permission_level | visible_features                                   |
      | admin            | all data, edit options, configuration settings     |
      | standard         | all data, limited edit options, no settings access |
      | limited          | only authorized project data, view-only access     |

  @trends @historical-data
  Scenario Outline: Verify historical trend analysis
    Given the user has navigated to the Functional Tests Insights view
    When the user selects the time period "<time_range>"
    Then trend visualizations should update to show data for that period
    And trend direction indicators should be clearly visible
    And selecting two different time periods should enable comparative analysis

    Examples:
      | time_range        |
      | Last 7 days       |
      | Last 30 days      |
      | Last quarter      |
      | Custom (date range)|

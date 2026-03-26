Feature: Functional Test Insights View
  As a user of the testing application
  I want to use the Functional Test Insights view
  So that I can analyze and visualize functional test results effectively

  Background:
    Given the user is logged into the application
    And functional test execution has been completed
    And Playwright test environment is properly configured

  Scenario: Navigate to Insights view for functional tests
    When the user navigates to the main dashboard
    And the user clicks on "Test Results"
    And the user selects "Functional Tests" category
    And the user clicks on "Insights View" option
    Then the Insights view for functional tests is displayed
    And the page title indicates "Functional Test Insights"
    And navigation breadcrumbs show the correct path
    And the URL contains the appropriate route parameter for functional test insights

  Scenario Outline: Verify navigation across different browsers
    Given the user is using "<browser>" browser
    When the user navigates to the main dashboard
    And the user clicks on "Test Results"
    And the user selects "Functional Tests" category
    And the user clicks on "Insights View" option
    Then the Insights view for functional tests is displayed correctly
    
    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  Scenario: Verify functional test data visualization
    Given the user has navigated to the Functional Test Insights view
    When the Insights view has fully loaded
    Then all charts and visualizations are properly rendered
    And data displayed matches the expected functional test results
    And no error messages are displayed
    And tooltips show accurate detailed information on hover

  Scenario: Verify data verification points in visualizations
    Given the user has navigated to the Functional Test Insights view
    When the user examines the data visualizations
    Then test pass/fail ratios are correctly displayed
    And execution time metrics are accurately represented
    And error distribution by test category is visualized
    And historical trends are properly charted

  Scenario Outline: Test filter functionality in Functional Test Insights view
    Given the user has navigated to the Functional Test Insights view
    When the user applies "<filter_type>" filter with value "<filter_value>"
    Then visualizations update dynamically
    And only functional test results matching filter criteria are displayed

    Examples:
      | filter_type        | filter_value   |
      | Test status        | passed         |
      | Test status        | failed         |
      | Test status        | skipped        |
      | Execution date     | Last 7 days    |
      | Execution date     | Last 30 days   |
      | Test suite         | Authentication |
      | Test category      | UI             |
      | Execution env      | Staging        |
      | Test duration      | > 5s           |

  Scenario: Test search functionality in Functional Test Insights view
    Given the user has navigated to the Functional Test Insights view
    When the user enters a search term in the search field
    Then only functional test results matching the search term are displayed
    And visualizations update to reflect the search results

  Scenario: Test filter combination functionality
    Given the user has navigated to the Functional Test Insights view
    When the user applies multiple filters in combination
    Then only functional test results matching all filter criteria are displayed
    And visualizations update to reflect the combined filter results

  Scenario: Test filter clear functionality
    Given the user has navigated to the Functional Test Insights view
    And the user has applied filters
    When the user clears all filters
    Then all functional test results are displayed
    And visualizations restore to their unfiltered state

  Scenario Outline: Verify cross-navigation between different test type insights views
    Given the user has navigated to the Functional Test Insights view
    When the user navigates to "<test_type>" Test Insights view
    Then "<test_type>" Test data is displayed correctly
    And the URL updates to reflect the current test type view
    
    Examples:
      | test_type   |
      | Unit        |
      | Integration |
      | API         |
      | Functional  |

  Scenario Outline: Test export functionality for Functional Test Insights
    Given the user has navigated to the Functional Test Insights view
    When the user exports data in "<format>" format
    Then the export generates a file in "<format>" format
    And exported data accurately represents what is displayed in the UI
    And the exported file can be opened in the appropriate application

    Examples:
      | format |
      | CSV    |
      | PDF    |
      | JSON   |
      | Excel  |

  Scenario: Test sharing functionality for Functional Test Insights
    Given the user has navigated to the Functional Test Insights view
    When the user generates a shareable link
    And accesses the shared link in a different browser session
    Then the same view with identical data and filters is displayed

  Scenario Outline: Verify responsive design of Functional Test Insights view
    Given the user has navigated to the Functional Test Insights view
    When the browser window is resized to "<device>" dimensions of "<width>x<height>"
    Then UI components reflow and resize appropriately
    And all charts and data visualizations remain visible and usable
    And no UI components overlap or become inaccessible
    And no horizontal scrolling is required

    Examples:
      | device  | width | height |
      | Desktop | 1920  | 1080   |
      | Tablet  | 768   | 1024   |
      | Mobile  | 375   | 667    |

  Scenario: Verify interactive elements on different screen sizes
    Given the user has navigated to the Functional Test Insights view
    When the user interacts with UI elements on different screen sizes
    Then all interactive elements remain functional
    And touch-friendly controls appear on mobile view

  Scenario: Test data consistency between backend API and UI
    Given the user has navigated to the Functional Test Insights view
    And API calls that provide functional test data are intercepted
    When the raw API response data is compared with UI displayed values
    Then all data points displayed in the UI match corresponding API values
    And summary statistics are correctly calculated from raw data
    And charts accurately represent the underlying numerical values

  Scenario Outline: Verify data consistency for specific metrics
    Given the user has navigated to the Functional Test Insights view
    And API calls are intercepted
    When checking the "<metric_type>" metrics
    Then UI values match API data for this metric type

    Examples:
      | metric_type        |
      | Test counts        |
      | Pass/fail ratios   |
      | Execution durations |
      | Error counts       |
      | Trend calculations |

  Scenario: Test user preference persistence
    Given the user has navigated to the Functional Test Insights view
    When the user changes display settings for chart types and metrics
    And applies custom filters to the data
    And changes the time range for displayed results
    And logs out and logs back in
    And returns to Functional Test Insights view
    Then all user preference settings are preserved
    And custom filters remain applied
    And selected time ranges persist
    And chart preferences remain as configured

  Scenario Outline: Test error handling with different data scenarios
    Given the test environment is configured to return "<data_condition>"
    When the user navigates to the Functional Test Insights view
    Then appropriate "<expected_message>" is displayed
    And the UI handles the condition gracefully

    Examples:
      | data_condition   | expected_message                |
      | empty data sets  | No data available               |
      | API errors       | Unable to load data             |
      | malformed data   | Error processing data           |
      | timeout          | Request timed out               |
      | partial data     | Some data could not be loaded   |

  Scenario: Verify error states provide actionable information
    Given the test environment is configured to return an API error
    When the user navigates to the Functional Test Insights view
    Then user-friendly error messages appear
    And retry mechanisms are available for failed data loads

  Scenario: Test accessibility compliance
    Given the user has navigated to the Functional Test Insights view
    When an automated accessibility audit is run
    Then no critical accessibility violations are detected
    And all interactive elements are reachable via keyboard
    And color contrast meets WCAG AA standards
    And screen readers can interpret all important information

  Scenario: Test keyboard navigation
    Given the user has navigated to the Functional Test Insights view
    When the user navigates through all interactive elements using keyboard
    Then focus indicators are visible on interactive elements
    And focus order is logical and follows visual layout

  Scenario Outline: Verify theme support in Functional Test Insights view
    Given the user has navigated to the Functional Test Insights view
    When the user switches to "<theme>" mode
    Then all UI components adjust colors appropriately
    And text remains readable with sufficient contrast
    And charts maintain clear visual distinction between elements
    And color indicators for test status remain distinguishable

    Examples:
      | theme |
      | dark  |
      | light |

  Scenario: Test custom dashboard creation
    Given the user has navigated to the Functional Test Insights view
    When the user clicks "Create Custom Dashboard" option
    And selects multiple visualization widgets to include
    And configures each widget with specific metrics and filters
    And arranges widgets in the desired layout
    And saves the custom dashboard with a unique name
    And navigates away and returns
    Then the custom dashboard persists with all configured settings
    And shows the selected visualization widgets
    And displays the configured metrics and filters

  Scenario: Test custom dashboard editing
    Given the user has created a custom dashboard
    When the user edits the dashboard to add/remove widgets
    And saves the changes
    Then the updates are persisted
    And the modified dashboard is displayed correctly

  Scenario Outline: Test historical trend analysis with different time periods
    Given the user has navigated to the Functional Test Insights view
    When the user selects "<time_period>" in the trend analysis section
    Then historical trends are accurately calculated and displayed
    And time period selector modifies the data range correctly
    And trend lines show correct direction based on underlying data

    Examples:
      | time_period    |
      | Last 7 days    |
      | Last 30 days   |
      | Last quarter   |
      | Custom range   |

  Scenario: Test trend comparison between time periods
    Given the user has navigated to the Functional Test Insights view
    When the user selects two time periods to compare trends
    Then comparative trends display clear visual distinction
    And statistical significance indicators are shown where applicable

  Scenario: Test real-time updates notification
    Given the user has navigated to the Functional Test Insights view
    And new functional test execution is triggered in another browser tab
    When the test execution completes
    Then the Insights view shows notification when new data is available
    And data freshness indicators show correct last-updated timestamp

  Scenario: Test manual refresh functionality
    Given the user has navigated to the Functional Test Insights view
    And new test results are available
    When the user clicks the refresh button
    Then the view updates with the latest data
    And new test results are correctly incorporated into visualizations

  Scenario: Test auto-refresh functionality
    Given the user has navigated to the Functional Test Insights view
    And auto-refresh setting is enabled
    When new test results become available
    Then the view periodically updates with new data
    And updates don't disrupt user interactions in progress

  Scenario: Test drill-down from summary to detailed test results
    Given the user has navigated to the Functional Test Insights view
    When the user clicks on a specific segment in a summary visualization
    Then the view transitions to a more detailed view of that segment
    And navigation breadcrumbs show current position in drill-down hierarchy

  Scenario: Test complete drill-down path to individual test case
    Given the user has navigated to the Functional Test Insights view
    When the user drills down through summary, category, and suite levels
    And selects an individual test case
    Then test case details page with full information is displayed
    And navigation back up the hierarchy works correctly
    And context is maintained when drilling down and navigating back

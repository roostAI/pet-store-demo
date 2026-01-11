Feature: Functional Tests Insights View

  Background:
    Given the user has valid credentials for the test reporting system
    And functional test results data is available in the system

  @ui
  Scenario: Navigate to Insights view for Functional tests
    Given the user is logged in to the test reporting dashboard
    When the user navigates to the "Test Reports" section
    And the user selects "Functional Tests" from the test type filter
    And the user clicks on the "Insights" tab for Functional tests
    Then the Insights view for Functional tests should load successfully
    And visualization components specific to Functional test metrics should be displayed
    And the page title should include "Functional Tests Insights"
    And navigation options to other test type insights should be available

  @ui
  Scenario Outline: Verify UI components render correctly across browsers
    Given the user is logged in to the test reporting dashboard using "<browser>"
    When the user navigates to the Functional Tests Insights view
    Then all visualization components should render without errors
    And metrics displayed should match the underlying test execution data
    And charts should accurately represent pass/fail/skip ratios
    And interactive elements should respond correctly to hover and click actions
    And visualizations should adapt appropriately to the viewport size

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  @ui
  Scenario Outline: Apply individual filters to Functional Tests Insights data
    Given the user is on the Functional Tests Insights view
    When the user applies the "<filter_type>" filter with value "<filter_value>"
    Then the visualizations should update to show only data matching "<filter_value>"
    And applied filter should be visibly indicated in the UI
    And filtered results count should reflect the data reduction

    Examples:
      | filter_type  | filter_value |
      | Date Range   | Last 7 days  |
      | Test Status  | Failed       |
      | Priority     | High         |
      | Tags         | regression   |
      | Test Status  | Passed       |
      | Priority     | Medium       |

  @ui
  Scenario: Apply multiple filters simultaneously
    Given the user is on the Functional Tests Insights view
    When the user applies the "Test Status" filter with value "Failed"
    And the user applies the "Priority" filter with value "High"
    And the user applies the "Date Range" filter with value "Last 30 days"
    Then the visualizations should update to show only data matching all applied filters
    And all applied filters should be visibly indicated in the UI
    And clearing all filters should restore the default view

  @ui
  Scenario Outline: Navigate between Insights view and detailed test reports
    Given the user is on the Functional Tests Insights view
    When the user clicks on the "<navigation_element>" to navigate to "<destination>"
    Then the user should be directed to the "<destination>" view
    And context from the Insights view should be preserved when appropriate
    And browser back navigation should return to the Insights view with previous state

    Examples:
      | navigation_element         | destination                    |
      | Failed tests chart         | Detailed failed tests report   |
      | Test type switcher for API | API Tests Insights             |
      | Flaky tests list          | Detailed flaky tests report    |
      | Test Run timeline         | Test run details               |

  @ui @performance
  Scenario Outline: Verify performance with large test result sets under various conditions
    Given the user has access to a large dataset of <test_count> functional test results
    And the network connection speed is simulated at <network_speed>
    When the user navigates to the Functional Tests Insights view
    Then the page should load within <expected_load_time> seconds
    And applying filters should complete within <expected_filter_time> seconds
    And scrolling through result tables should remain smooth
    And no UI freezing should occur during data processing operations

    Examples:
      | test_count | network_speed | expected_load_time | expected_filter_time |
      | 1000       | high          | 3                  | 2                    |
      | 5000       | medium        | 5                  | 3                    |
      | 10000      | low           | 8                  | 5                    |

  @ui @accessibility
  Scenario Outline: Verify accessibility compliance for Functional Tests Insights view
    Given the user accesses the Functional Tests Insights view with "<assistive_technology>"
    When an automated accessibility audit is run on the page
    Then no critical or serious accessibility violations should be detected
    And all interactive elements should be accessible via keyboard navigation
    And all text should meet minimum contrast ratio requirements
    And all charts should have appropriate text alternatives

    Examples:
      | assistive_technology |
      | Screen reader        |
      | Keyboard only        |
      | High contrast mode   |

  @ui @data
  Scenario Outline: Verify consistency between raw test data and visualizations
    Given the user has access to raw functional test result data
    And a test run with ID "<test_run_id>" has <total_tests> tests with <passed> passes and <failed> failures
    When the user navigates to the Functional Tests Insights view for test run "<test_run_id>"
    Then the pass/fail chart should show <passed_percentage>% passed and <failed_percentage>% failed
    And the numerical metrics should display <total_tests> total, <passed> passed, and <failed> failed tests
    And all visualizations should accurately reflect the raw data values

    Examples:
      | test_run_id | total_tests | passed | failed | passed_percentage | failed_percentage |
      | FT-1001     | 100         | 80     | 20     | 80                | 20                |
      | FT-1002     | 200         | 150    | 50     | 75                | 25                |
      | FT-1003     | 50          | 50     | 0      | 100               | 0                 |
      | FT-1004     | 75          | 0      | 75     | 0                 | 100               |

  @ui
  Scenario Outline: Customize and persist Insights view configuration
    Given the user is on the Functional Tests Insights view
    When the user changes the visualization type for "<metric>" from "<original_type>" to "<new_type>"
    And the user rearranges the layout by moving components
    And the user saves the customized configuration
    And the user logs out and logs back in
    And the user navigates to the Functional Tests Insights view
    Then the visualization for "<metric>" should be displayed as "<new_type>"
    And the custom layout arrangement should be preserved
    And resetting to default configuration should restore the original layout

    Examples:
      | metric         | original_type | new_type   |
      | Pass/Fail      | Pie chart     | Bar chart  |
      | Test Duration  | Line chart    | Table      |
      | Flaky Tests    | Table         | Heat map   |

  @ui
  Scenario Outline: Handle error and edge cases in the Insights view
    Given the user is on the Functional Tests Insights view
    When "<error_condition>" occurs
    Then an appropriate "<error_message>" should be displayed
    And the UI should remain stable without crashing
    And a recovery method should be available when applicable

    Examples:
      | error_condition                    | error_message                                        |
      | No test data available             | No functional test results found for this time range |
      | Network interruption during loading | Unable to load data. Check your connection.         |
      | Access to non-existent test run    | The requested test run does not exist                |
      | Impossible filter combination      | No results match the selected filter criteria        |
      | Malformed test result data         | Error processing test data. Please contact support.  |

  @ui
  Scenario Outline: Export and share Functional Tests Insights
    Given the user is on the Functional Tests Insights view with meaningful test data
    When the user exports the data in "<format>" format
    Then the export should complete successfully
    And the exported content should accurately reflect what is shown in the UI
    And all data should be properly formatted in the exported file

    Examples:
      | format |
      | PDF    |
      | CSV    |
      | PNG    |
      | Excel  |

  @api @auth
  Scenario Outline: Verify authentication and role-based access control
    Given a user with role "<role>"
    When the user attempts to access the Functional Tests Insights view
    Then the system should respond with "<access_status>"
    And the user should be able to perform actions according to "<permissions>"

    Examples:
      | role           | access_status | permissions                                      |
      | Admin          | Granted       | View and modify all configurations               |
      | Viewer         | Granted       | View only, no configuration changes allowed      |
      | Unauthenticated| Denied        | Redirected to login page                         |
      | No permissions | Denied        | Access denied message displayed                  |

  @ui
  Scenario Outline: Verify historical trend analysis visualization
    Given the user is on the Functional Tests Insights view
    When the user selects "<time_period>" as the time range
    Then trend visualization should display data points for all test runs in that period
    And trend indicators should accurately reflect the progression of metrics
    And statistical indicators should be mathematically correct

    Examples:
      | time_period    |
      | Last 7 days    |
      | Last 30 days   |
      | Last quarter   |
      | Custom range   |

  @ui
  Scenario: Verify test coverage visualization
    Given the user is on the Functional Tests Insights view
    When the user navigates to the coverage section
    Then coverage visualizations should accurately represent test coverage data
    And percentage values should match the underlying coverage calculations
    And color coding should clearly differentiate between coverage levels
    And areas with critical coverage gaps should be prominently highlighted

  @ui @responsive
  Scenario Outline: Verify cross-device compatibility
    Given the user accesses the Functional Tests Insights view on "<device>" with "<orientation>"
    Then all visualizations should be appropriately sized and visible
    And layout should adapt to the screen size
    And interactive elements should be appropriately sized for the device
    And all functionality should remain accessible

    Examples:
      | device      | orientation |
      | Desktop     | Landscape   |
      | Tablet      | Landscape   |
      | Tablet      | Portrait    |
      | Smartphone  | Portrait    |
      | Smartphone  | Landscape   |

  @ui @api
  Scenario: Verify real-time updates of test results
    Given the user is on the Functional Tests Insights view
    And a new functional test run is in progress
    When the test run completes
    Then the Insights view should update within the configured refresh interval
    And all visualizations should reflect the latest data after updates
    And user interactions should not be interrupted during the update process
    And no data inconsistencies should occur during the update process

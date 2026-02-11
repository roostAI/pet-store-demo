Feature: Functional Tests Insights View
  As a quality engineer or product manager
  I want to access and interact with the Functional Tests Insights view
  So that I can analyze and understand functional test results

  Background:
    Given I am logged in as a user with appropriate permissions
    And functional test results are available in the system

  @navigation @smoke
  Scenario: Navigate to Insights view for Functional Tests
    Given I am on the test reporting dashboard
    When I navigate to the Test Reports section
    And I select "Functional Tests" from the test type filter if available
    And I click on the "Insights" tab for Functional tests
    Then the Insights view for Functional tests loads successfully
    And the page title or breadcrumb indicates "Functional Tests Insights"
    And navigation options to other test type insights are available

  @ui-components @smoke
  Scenario Outline: Verify UI components render correctly in different browsers
    Given I am on the Functional Tests Insights view
    When I use "<browser>" with viewport size "<viewport>"
    Then all visualization components render without errors
    And metrics displayed match the underlying test execution data
    And charts accurately represent pass/fail/skip ratios
    And interactive elements respond correctly to hover actions

    Examples:
      | browser | viewport     |
      | Chrome  | 1920x1080    |
      | Firefox | 1920x1080    |
      | Safari  | 1920x1080    |
      | Edge    | 1920x1080    |
      | Chrome  | 1366x768     |
      | Firefox | 768x1024     |

  @filtering @sorting
  Scenario Outline: Apply filters to Functional Tests Insights data
    Given I am on the Functional Tests Insights view
    When I apply the filter "<filter_type>" with value "<filter_value>"
    Then the visualizations update to show only matching data
    And the applied filter is visible in the active filters section

    Examples:
      | filter_type  | filter_value      |
      | date_range   | Last 7 days       |
      | date_range   | Last 30 days      |
      | test_status  | Passed            |
      | test_status  | Failed            |
      | test_status  | Skipped           |
      | priority     | High              |
      | priority     | Medium            |
      | tags         | regression        |

  @filtering @multiple-filters
  Scenario: Apply multiple simultaneous filters
    Given I am on the Functional Tests Insights view
    When I apply the filter "test_status" with value "Failed"
    And I apply the filter "priority" with value "High"
    And I apply the filter "date_range" with value "Last 30 days"
    Then the visualizations update to show only matching data
    And all applied filters are visible in the active filters section
    When I clear all filters
    Then the default comprehensive view is restored

  @search
  Scenario Outline: Search for specific test cases
    Given I am on the Functional Tests Insights view
    When I use the search functionality with term "<search_term>"
    Then only test cases containing "<search_term>" are displayed
    And the result count indicates the number of matching items

    Examples:
      | search_term      |
      | login            |
      | authentication   |
      | payment          |
      | ZBIO-FI          |

  @navigation @cross-navigation
  Scenario: Navigate between Insights view and detailed test reports
    Given I am on the Functional Tests Insights view
    When I click on a failed tests visualization
    Then I am taken to the detailed test reports for failed tests
    When I navigate back to the Insights view
    And I click on a link to switch to "API Tests" insights
    Then the API Tests Insights view is displayed

  @performance
  Scenario Outline: Verify performance with different data volumes
    Given I am on the Functional Tests Insights view
    When test data contains "<volume>" test results
    And I apply complex filters requiring data processing
    Then the page loads within "<expected_load_time>" seconds
    And visualization components render progressively with loading indicators
    And filter operations complete within "<expected_filter_time>" seconds
    And no UI freezing occurs during data processing

    Examples:
      | volume        | expected_load_time | expected_filter_time |
      | 100 tests     | 2                  | 1                    |
      | 1000 tests    | 3                  | 2                    |
      | 10000 tests   | 5                  | 3                    |

  @accessibility
  Scenario Outline: Verify accessibility compliance
    Given I am on the Functional Tests Insights view
    When I run an automated accessibility audit
    Then no critical or serious violations are found
    And all text meets minimum contrast ratio requirements
    And all interactive elements are accessible via keyboard navigation
    And screen readers can interpret "<content_type>" content properly

    Examples:
      | content_type            |
      | charts                  |
      | tables                  |
      | filter controls         |
      | navigation components   |
      | notification messages   |

  @data-accuracy
  Scenario: Verify consistency between raw data and visualizations
    Given I have access to raw functional test result data
    And I have recorded expected metrics from the raw data
    When I navigate to the Functional Tests Insights view for the same test runs
    Then numerical values in visualizations exactly match calculated values
    And percentage representations are mathematically correct
    And trend lines accurately represent changes over time
    And statistical aggregations properly represent the data distribution

  @customization
  Scenario: Configure and customize the Insights view
    Given I am on the Functional Tests Insights view
    When I locate and open configuration options
    And I change visualization type for pass rate from "pie chart" to "bar chart"
    And I rearrange visualization components
    And I save the customized configuration
    Then the modifications are applied to the view
    When I log out and log back in
    Then my custom configuration is preserved
    When I reset to default configuration
    Then the view returns to system default state

  @error-handling
  Scenario Outline: Handle error conditions gracefully
    Given I am on the Functional Tests Insights view
    When a "<error_condition>" occurs
    Then an appropriate error message is displayed
    And the system remains stable without crashing
    And recovery options are provided when applicable

    Examples:
      | error_condition                    |
      | no test data available             |
      | non-existent test run access       |
      | network interruption               |
      | contradictory filter combination   |
      | malformed test result data         |

  @export
  Scenario Outline: Export insights in different formats
    Given I am on the Functional Tests Insights view
    When I select export option for "<format>"
    Then the export process completes successfully
    And the exported content in "<format>" accurately reflects UI data
    And all visualizations and metrics are included as appropriate for the format

    Examples:
      | format     |
      | PDF        |
      | CSV        |
      | Excel      |
      | PNG        |

  @sharing
  Scenario: Generate and use shareable links
    Given I am on the Functional Tests Insights view with specific filters applied
    When I generate a shareable link
    And I copy the link and open it in a new browser session
    Then the exact same view with identical filters is displayed

  @authorization
  Scenario Outline: Verify role-based access control
    Given I attempt to access Functional Tests Insights with "<user_type>" permissions
    Then access is "<access_result>"
    And appropriate error messages are shown when access is denied

    Examples:
      | user_type                      | access_result |
      | unauthenticated                | denied        |
      | authenticated without permissions | denied     |
      | view-only permissions          | granted       |
      | admin permissions              | granted       |

  @trends
  Scenario: View and analyze historical trends
    Given I am on the Functional Tests Insights view
    When I locate trend analysis visualizations
    And I select different time ranges for analysis
    Then data points match known test execution dates
    And trend lines accurately reflect progression over time
    And statistical indicators are mathematically correct

  @coverage
  Scenario: Analyze test coverage visualization
    Given I am on the Functional Tests Insights view
    When I locate coverage visualization components
    Then coverage percentages match calculated values
    And color coding clearly differentiates between coverage levels
    When I drill down into specific application areas
    Then detailed coverage information is displayed
    And areas with insufficient coverage are highlighted

  @responsiveness
  Scenario Outline: Verify responsiveness on different devices
    Given I access the Functional Tests Insights view on "<device_type>" with "<orientation>"
    Then all visualizations are appropriately sized and visible
    And layout adapts to the screen dimensions
    And all functionality remains accessible
    And no horizontal scrolling is required
    And text remains readable without zooming

    Examples:
      | device_type | orientation |
      | desktop     | landscape   |
      | tablet      | landscape   |
      | tablet      | portrait    |
      | mobile      | portrait    |
      | mobile      | landscape   |

  @real-time
  Scenario: Verify real-time updates of insights data
    Given I am on the Functional Tests Insights view
    And I note current metrics and visualization states
    When new functional test results become available in the system
    Then the insights view updates automatically within the configured time interval
    And visual indicators show when updates are occurring
    And all visualizations reflect the latest data after updates

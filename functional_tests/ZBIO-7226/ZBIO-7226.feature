Feature: Playwright Insights View for Functional Tests
  As a quality engineer
  I want to access and interact with the Insights view for functional tests
  So that I can analyze test results and make informed decisions

  Background:
    Given the user has appropriate permissions to access the Insights view
    And the Playwright testing framework is installed and configured

  @setup @integration
  Scenario: Initialize Playwright Support for Insights View
    Given Playwright test environment is initialized with required configurations
    And necessary Insights view modules are imported
    When I create a basic test that navigates to the application
    And I navigate to the Insights view section
    And I select the Functional tests tab in the Insights view
    Then the Insights interface should load correctly
    And no console errors related to Playwright-Insights integration should appear

  @functional @results-display
  Scenario Outline: Verify Functional Test Results Display with Different Statuses
    Given a set of functional tests with <status> outcomes have been executed
    When I navigate to the application and log in
    And I access the Insights view
    And I filter to view only Functional test results
    Then all executed test cases should appear in the list
    And test status should accurately show <status> with appropriate <indicator>
    And test execution times should be displayed
    And test details should be accessible by clicking on individual tests

    Examples:
      | status   | indicator      |
      | passed   | green checkmark |
      | failed   | red cross       |
      | skipped  | yellow warning  |

  @functional @filtering @sorting
  Scenario Outline: Filter Functional Test Results by Various Criteria
    Given multiple functional tests with varying statuses exist in the system
    When I navigate to the application and access the Insights view
    And I select to view Functional test results
    And I apply filter by "<filter_type>" with value "<filter_value>"
    Then only test results matching "<filter_value>" should be displayed
    And filter status indicators should show the applied filters

    Examples:
      | filter_type | filter_value |
      | status      | passed       |
      | status      | failed       |
      | status      | skipped      |
      | test name   | login        |
      | date range  | last 7 days  |

  @functional @sorting
  Scenario Outline: Sort Functional Test Results by Different Criteria
    Given multiple functional tests with varying attributes exist in the system
    When I navigate to the application and access the Insights view
    And I select to view Functional test results
    And I sort results by "<sort_criterion>" in "<sort_direction>" order
    Then test results should be arranged according to "<sort_criterion>" in "<sort_direction>" order

    Examples:
      | sort_criterion | sort_direction |
      | execution time | ascending      |
      | execution time | descending     |
      | test name      | ascending      |
      | test name      | descending     |
      | status         | ascending      |
      | status         | descending     |

  @cross-browser @compatibility
  Scenario Outline: Verify Cross-Browser Compatibility of Insights View
    Given functional test results are available in the system
    When I configure Playwright to use "<browser>" browser
    And I navigate to the Insights view
    And I select the Functional tests tab
    Then all UI elements should render correctly
    And all functionality should work as expected
    And no browser-specific console errors should appear

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  @functional @export @reporting
  Scenario Outline: Export Functional Test Results in Different Formats
    Given functional test results with various statuses exist in the system
    When I navigate to the application and access the Insights view
    And I filter to view Functional test results
    And I click on the export/download option for "<format>" format
    Then the data should be exported in "<format>" format
    And the exported data should match what is displayed in the UI
    And the exported file should contain valid data

    Examples:
      | format |
      | CSV    |
      | JSON   |
      | PDF    |

  @functional @error-handling @debugging
  Scenario: Validate Error Handling for Failed Functional Tests
    Given functional tests with deliberate failures have been executed
    When I navigate to the application and access the Insights view
    And I filter to show only failed functional tests
    And I select a failed test from the list
    Then error messages should be visible and clear
    And screenshots of the failure state should be available
    And console logs and error traces should provide sufficient debugging information
    And stack traces should be properly formatted and readable

  @responsive @multi-device
  Scenario Outline: Test Responsiveness of Insights View Across Screen Sizes
    Given functional test results exist in the system
    When I access the Insights view with viewport size "<screen_size>"
    Then the layout should adjust appropriately to the screen size
    And all content should remain accessible
    And UI controls should remain usable
    And no horizontal scrolling should be required (except for data tables if applicable)

    Examples:
      | screen_size  |
      | 1920x1080    |
      | 768x1024     |
      | 375x667      |

  @integration @real-time-updates
  Scenario: Verify Integration Between Test Execution and Real-Time Updates
    Given I have the Insights view open in the browser
    And I note the current functional test results and timestamps
    When a new batch of functional tests is executed in a separate process
    And I wait for the configured update interval
    Then new test results should appear in the Insights view
    And test statuses and execution times should be accurate
    And timestamps should reflect actual execution times

  @security @authentication @authorization
  Scenario Outline: Test Authentication and Authorization for Insights Access
    Given a user with "<permission_level>" permissions exists
    When I attempt to access the Insights view as that user
    Then access should be "<access_result>"
    And appropriate messages should be displayed for unauthorized access

    Examples:
      | permission_level | access_result   |
      | no_access        | denied          |
      | read_only        | granted_limited |
      | full_access      | granted_full    |
      | unauthenticated  | redirected      |

  @performance @large-datasets
  Scenario: Validate Performance with Large Functional Test Datasets
    Given a large dataset of at least 500 functional test results is available
    When I navigate to the Insights view in the application
    And I filter to show only functional test results
    Then the initial page should load within 3 seconds
    And rendering of test results should complete within 1 second for visible elements
    And scrolling through results should be smooth without lag
    And filter operations should complete within 2 seconds
    And sorting operations should complete within 2 seconds
    And search should return results within 1 second

  @functional @search-functionality
  Scenario Outline: Test Search Functionality for Functional Tests
    Given multiple functional test results with various test names and descriptions exist
    When I navigate to the application and access the Insights view
    And I switch to the Functional tests section
    And I enter "<search_term>" in the search input field
    Then search results should update to show only matching tests
    And <expected_result>

    Examples:
      | search_term   | expected_result                                     |
      | login         | tests containing "login" in name or description     |
      | auth failure  | failed tests with authentication errors             |
      | !@#$%^        | special characters should be handled appropriately  |
      | nonexistent   | "No results" state should be displayed              |

  @functional @pagination
  Scenario Outline: Test Pagination with Large Sets of Functional Test Results
    Given a large number of functional test results exist spanning multiple pages
    When I navigate to the Insights view and select the Functional tests section
    And I navigate to page <page_number> using pagination controls
    Then the correct set of test results for page <page_number> should be displayed
    And the current page indicator should show <page_number>
    And navigation to adjacent pages should work correctly

    Examples:
      | page_number |
      | 1           |
      | 2           |
      | 3           |

  @analytical @trends
  Scenario: Verify Historical Trend Analysis for Functional Tests
    Given historical data for functional tests from multiple test runs exists
    When I navigate to the Insights view and select the Functional tests section
    And I select the historical trends or analytics view
    Then trend charts for pass/fail rates over time should be visible
    And test execution duration trends should be displayed
    And date range selectors should function correctly
    And selecting different time periods should update the displayed data
    And trend data should match actual test history for accuracy

  @integration @unified-view
  Scenario: Test Integration Between Functional Tests and Other Test Types
    Given results exist for Functional, Unit, Integration, and API tests
    When I navigate to the Insights view's unified dashboard
    Then all test types should be represented in the view
    And summary metrics should show aggregated data across all test types
    And filtering by test type should work correctly
    And cross-referencing between related tests should be possible
    And status indicators and metrics should be consistent across test types

  @functional @custom-tagging
  Scenario: Validate Custom Tagging of Functional Tests
    Given functional test results exist in the system
    When I navigate to the Insights view and select the Functional tests section
    And I create a new custom tag "Critical-Path"
    And I apply the custom tag to selected functional test results
    Then tagged tests should show the appropriate indicators
    And filtering by the custom tag should return only the tagged tests
    And custom tags should persist across sessions
    And tags should be removable from selected tests

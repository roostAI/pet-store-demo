Feature: Functional Test Insights Dashboard

  Background:
    Given the application is deployed and accessible
    And the user has appropriate permissions to view test insights
    And functional test data exists in the system

  Scenario: Verify Basic Insights View Access for Functional Tests
    Given the user has launched the application
    When the user navigates to the test insights dashboard
    And the user clicks on the Functional test insights tab
    Then the Functional test insights view should load successfully
    And all expected UI elements should be visible
    And no console errors should be present
    And the page should load within acceptable performance parameters

  Scenario: Verify Functional Test Data Display
    Given the user is on the Functional test insights view
    When the user examines the test data display
    Then the test count statistics should be displayed correctly
    And pass/fail metrics should be accurate
    And test execution times should be displayed
    And graphs/charts should display correctly
    And all data should match expected values from the test database

  Scenario Outline: Test Filtering Functionality in Functional Test Insights
    Given the user is on the Functional test insights view
    When the user applies a filter by "<filter_type>"
    Then the results should be filtered according to the "<filter_criteria>"
    And the filtered results should match the expected criteria
    And the filter UI component should show the active filter state

    Examples:
      | filter_type | filter_criteria |
      | status      | Passed          |
      | status      | Failed          |
      | date range  | Last 7 days     |
      | date range  | Last 30 days    |
      | test type   | UI Tests        |
      | test type   | API Tests       |

  Scenario Outline: Sort Functional Test Results in Insights View
    Given the user is on the Functional test insights view
    When the user clicks on the "<column>" column header to sort in "<direction>" order
    Then the results should be sorted by "<column>" in "<direction>" order
    And the sort indicator should display correctly in the UI

    Examples:
      | column          | direction  |
      | test name       | ascending  |
      | test name       | descending |
      | execution time  | ascending  |
      | execution time  | descending |
      | status          | ascending  |
      | status          | descending |
      | last run date   | ascending  |
      | last run date   | descending |

  Scenario Outline: Search Functionality in Functional Test Insights
    Given the user is on the Functional test insights view
    When the user enters "<search_term>" in the search input field
    Then the search results should display tests matching "<search_term>"
    And the number of results should match the expected count

    Examples:
      | search_term              | 
      | login                    |
      | TC-001                   |
      | failed                   |
      | API                      |
      | nonexistent_test_name    |
      | special!@#$characters    |
      | UI test                  |

  Scenario: Pagination of Functional Test Results
    Given the user is on the Functional test insights view
    And there are more functional test results than fit on a single page
    When the user observes the pagination controls
    Then pagination controls should be displayed
    When the user navigates to the second page
    Then a different set of results should be displayed
    When the user navigates to the last page
    Then the last set of results should be displayed
    When the user navigates back to the first page
    Then the first set of results should be displayed
    When the user changes the items per page setting
    Then the number of displayed items should change accordingly

  Scenario: Detailed View of Individual Functional Test
    Given the user is on the Functional test insights view
    When the user selects a specific test result
    Then the detailed information panel should open
    And all expected detailed information should be displayed
    When the user navigates back to the main insights view
    And selects a different test result
    Then the detailed information for the second test should be displayed
    And all associated artifacts should be accessible

  Scenario Outline: Date Range Selection for Functional Test Insights
    Given the user is on the Functional test insights view
    When the user selects the date range "<range_type>"
    Then the results should update to show only tests from the "<range_type>" period
    And the UI should display the currently selected date range

    Examples:
      | range_type          |
      | Last 7 days         |
      | Last 30 days        |
      | Last 90 days        |
      | This month          |
      | Previous month      |
      | Custom date range   |
      | All time            |

  Scenario Outline: Export Functionality for Functional Test Insights
    Given the user is on the Functional test insights view
    When the user clicks the export button
    And selects "<format>" as the export format
    Then the file should be downloaded in "<format>" format
    And the exported file should contain all the expected data
    And the data should match what's displayed in the UI

    Examples:
      | format |
      | CSV    |
      | PDF    |
      | Excel  |
      | JSON   |

  Scenario: Comparison View Between Different Functional Test Runs
    Given the user is on the Functional test insights view
    When the user activates the comparison feature
    And selects two different test runs for comparison
    Then the comparison data should be displayed correctly
    And differences between runs should be clearly indicated
    And key metrics should be compared side-by-side
    And visual indicators should identify improvements or regressions

  Scenario: Integration with Other Test Types in Insights Dashboard
    Given the user is on the main insights dashboard
    Then the Functional test insights should be displayed alongside other test types
    When the user navigates between different test type views
    Then the navigation should be consistent and intuitive
    When the user applies global filters
    Then all applicable test types should be affected appropriately
    And aggregate metrics should correctly include functional test data
    And the overall dashboard should provide a cohesive view of all test types

  Scenario Outline: Responsive Design of Functional Test Insights View
    Given the user is on the Functional test insights view
    When the viewport size is set to "<device>" dimensions
    Then the insights view should render appropriately for the "<device>" viewport
    And no horizontal scrolling should be needed
    And all features should remain accessible
    And charts and data visualizations should resize appropriately

    Examples:
      | device  |
      | desktop |
      | tablet  |
      | mobile  |

  Scenario: Error Handling for Missing Functional Test Data
    Given the user is on the Functional test insights view
    When there is no functional test data available to display
    Then a clear, user-friendly message should indicate that no data is available
    And there should be no broken UI elements
    And options to modify filters or take other actions should be provided
    And the empty state should appear visually appropriate
    And charts and visualizations should handle empty data gracefully

  Scenario: Trend Analysis for Functional Tests
    Given the user is on the Functional test insights view
    When the user examines trend visualization components
    Then trends over time should be correctly displayed
    When the user changes the time range
    Then the trend display should update accordingly
    When the user hovers over trend points
    Then tooltips with detailed information should appear
    And any trend anomalies should be appropriately highlighted
    And the visual representation should be clear and meaningful

  Scenario Outline: User Permissions for Functional Test Insights
    Given the user is logged in with "<permission_level>" permissions
    When the user navigates to the Functional test insights view
    Then the user should have "<access_type>" to the insights features
    And the UI should adjust based on user permissions

    Examples:
      | permission_level | access_type                  |
      | admin            | full access to all features  |
      | read-only        | view-only access             |
      | no-permission    | access denied                |
      | analyst          | access to view and export    |

  Scenario: Performance of Functional Test Insights View Loading
    Given the user has a stable network connection
    When the user navigates to the Functional test insights view
    Then the initial page load should complete within 3 seconds
    And the UI should remain responsive during data loading
    And loading indicators should be displayed for operations taking more than 1 second
    When the user performs filtering operations
    Then the filter operations should complete within 1 second
    When the user performs sorting operations
    Then the sort operations should complete within 1 second

  Scenario: Accessibility of Functional Test Insights View
    Given the user is on the Functional test insights view
    When an automated accessibility audit is run
    Then no critical accessibility violations should be found
    When navigating through all interactive elements using keyboard
    Then all elements should be keyboard accessible
    And heading structure should be logical and hierarchical
    And color contrast should meet WCAG AA standards
    And ARIA attributes should be correctly implemented
    And focus indicators should be clearly visible

  Scenario Outline: Browser Compatibility for Functional Test Insights
    Given the user is using "<browser>" browser
    When the user navigates to the Functional test insights view
    Then all features should work as expected
    And the visual appearance should be consistent
    And all interactive elements should work properly
    And no browser console errors should be present

    Examples:
      | browser  |
      | Chrome   |
      | Firefox  |
      | Safari   |
      | Edge     |

  Scenario: Security of Functional Test Insights Data Access
    Given the user is not authenticated
    When the user attempts to access the Functional test insights view
    Then the user should be redirected to the login page
    
    Given the user is logged in with appropriate permissions
    When the user accesses the Functional test insights view
    Then the user should have access to the data
    
    Given the user is logged in without appropriate permissions
    When the user attempts to access the Functional test insights view
    Then access should be appropriately restricted
    
    When attempting direct URL access to protected insights data
    Then the access should be properly protected
    
    When examining network responses
    Then no sensitive data should be exposed

  Scenario: Data Accuracy in Functional Test Insights
    Given the user is on the Functional test insights view
    When the user examines key metrics displayed
    Then all displayed data should match the source data
    And calculated metrics should be mathematically correct
    And data should be consistent across different views
    And historical trends should accurately reflect past test results
    When new test results are added to the system
    Then the insights view should correctly incorporate the new results

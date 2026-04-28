Feature: Functional Test Insights View
  As a quality assurance engineer
  I want to access and interact with the Functional Test Insights view
  So that I can analyze and manage Playwright test results effectively

  Background:
    Given the user is logged into the system with appropriate permissions
    And Playwright tests have been executed with various statuses
    And test results are available in the system

  Scenario: Navigate to Functional Test Insights view from main dashboard
    Given the user is on the main dashboard page
    When the user clicks on the "Test Insights" navigation element
    And the user clicks on the "Functional Tests" tab
    Then the Functional Tests Insights view should load successfully
    And the page title should indicate "Functional Test Insights"
    And the navigation breadcrumb should reflect the current location
    And all UI components should be visible
    And the layout should be consistent with existing test views

  Scenario Outline: Verify Functional Test Insights view across different browsers
    Given the user is using "<browser>" browser
    When the user navigates to the Functional Test Insights view
    Then all UI components should be displayed correctly
    And all functionality should work as expected

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  Scenario: Verify display of test results with different statuses
    Given the user is on the Functional Test Insights view
    When the user examines the list of functional test results
    Then each test result should show a clear status indicator
    And passed tests should have green status indicators
    And failed tests should have red status indicators
    And skipped tests should have gray status indicators

  Scenario: Access detailed information for a passed test
    Given the user is on the Functional Test Insights view
    When the user clicks on a passed test to expand its details
    Then detailed information about the test execution should be displayed
    And execution time should be visible
    And browser information should be displayed
    And the user should be able to collapse the test details

  Scenario: Access detailed information for a failed test
    Given the user is on the Functional Test Insights view
    When the user clicks on a failed test to expand its details
    Then detailed information about the test execution should be displayed
    And error messages should be visible
    And stack traces should be displayed
    And links to test artifacts should be available

  Scenario Outline: Filter test results by status
    Given the user is on the Functional Test Insights view
    When the user applies a filter to show only "<status>" tests
    Then only tests with "<status>" status should be displayed
    And the current filter selection should be visually indicated

    Examples:
      | status  |
      | passed  |
      | failed  |
      | skipped |

  Scenario Outline: Filter test results by browser
    Given the user is on the Functional Test Insights view
    When the user applies a filter to show only tests executed in "<browser>"
    Then only tests executed in "<browser>" should be displayed

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  Scenario: Apply multiple filters simultaneously
    Given the user is on the Functional Test Insights view
    When the user applies a filter to show only failed tests
    And the user applies another filter to show only tests executed in Chrome
    Then only failed tests executed in Chrome should be displayed

  Scenario: Clear all applied filters
    Given the user is on the Functional Test Insights view
    And filters are currently applied to the test results
    When the user clears all filters
    Then all test results should be displayed

  Scenario Outline: Sort test results by different criteria
    Given the user is on the Functional Test Insights view
    When the user sorts tests by "<criterion>" in "<order>" order
    Then test results should be ordered correctly according to the selected criterion

    Examples:
      | criterion      | order       |
      | execution time | ascending   |
      | execution time | descending  |
      | test name      | alphabetical|
      | status         | default     |

  Scenario: Navigate between different test type views
    Given the user is on the Test Insights dashboard
    When the user switches to the "Unit Tests" view
    And the user notes the UI layout and components
    And the user switches to the "Integration Tests" view
    And the user switches to the "API Tests" view
    And the user switches to the "Functional Tests" view
    Then all views should have consistent UI components
    And common functionality should work similarly across all views
    And visual design elements should be consistent

  Scenario: Access screenshot artifact from a failed test
    Given the user is on the Functional Test Insights view
    When the user clicks on a failed test to expand its details
    And the user clicks on a screenshot link
    Then the screenshot should open correctly in an appropriate viewer
    And the user should be able to return to the test details

  Scenario: Access video recording artifact from a failed test
    Given the user is on the Functional Test Insights view
    When the user clicks on a failed test to expand its details
    And the user clicks on a video recording link
    Then the video should play correctly
    And the user should be able to return to the test details

  Scenario: Access Playwright trace from a failed test
    Given the user is on the Functional Test Insights view
    When the user clicks on a failed test to expand its details
    And the user clicks on a trace link
    Then the trace viewer should open correctly
    And the user should be able to return to the test details

  Scenario: Download test artifacts
    Given the user is on the Functional Test Insights view
    When the user clicks on a failed test to expand its details
    And the user downloads a test artifact
    Then the download should complete successfully
    And the downloaded file should be valid

  Scenario: Verify dashboard summary statistics
    Given the user is on the Functional Test Insights view
    When the user observes the summary statistics section
    Then the displayed count of total tests should match the actual number of tests
    And the pass/fail percentages should accurately reflect the test results
    And the average execution time should be calculated correctly

  Scenario: Change time period for summary statistics
    Given the user is on the Functional Test Insights view
    When the user changes the time period to "Last 7 days"
    Then the summary statistics should update to reflect the selected time period
    And the trends visualization should show data for the last 7 days

  Scenario Outline: Search for tests by different criteria
    Given the user is on the Functional Test Insights view
    When the user searches for "<search_term>" in the search field
    Then tests matching the search criteria should be displayed

    Examples:
      | search_term               |
      | login functionality       |
      | AssertionError            |
      | element not found         |
      | navigation                |
      | authentication            |

  Scenario: Search with partial test name
    Given the user is on the Functional Test Insights view
    When the user enters a partial test name in the search field
    Then all tests containing the search term should be displayed

  Scenario: Clear search criteria
    Given the user is on the Functional Test Insights view
    And search criteria have been applied
    When the user clears the search field
    Then all test results should be displayed

  Scenario Outline: Export test results in various formats
    Given the user is on the Functional Test Insights view
    When the user selects "<format>" as the export format
    And the user initiates the export
    Then the download should complete successfully
    And the exported file should contain all relevant test data in appropriate format

    Examples:
      | format |
      | CSV    |
      | PDF    |
      | JSON   |

  Scenario: Export filtered test results
    Given the user is on the Functional Test Insights view
    And the user has applied filters to show only failed tests
    When the user exports the test results
    Then the exported file should only contain the filtered test results

  Scenario: View test execution history for a specific test
    Given the user is on the Functional Test Insights view
    When the user selects a specific test that has been run multiple times
    And the user views the execution history for that test
    Then the history should show status across multiple runs
    And execution times for each run should be displayed

  Scenario: Compare results between different test runs
    Given the user is on the Functional Test Insights view
    When the user selects two different runs of the same test for comparison
    Then the detailed differences between the two test runs should be displayed
    And performance changes should be visually indicated

  Scenario: Run accessibility audit on Functional Tests Insights view
    Given the user is on the Functional Test Insights view
    When an accessibility audit is performed
    Then no critical accessibility issues should be reported
    And all interactive elements should have appropriate keyboard focus indicators
    And all text should meet WCAG 2.1 AA contrast requirements

  Scenario: Navigate using keyboard only
    Given the user is on the Functional Test Insights view
    When the user navigates through all functionality using only keyboard
    Then all features should be accessible without using a mouse
    And focus indicators should be visible during keyboard navigation

  Scenario: View performance metrics visualization
    Given the user is on the Functional Test Insights view
    When the user examines the performance metrics section
    Then test duration metrics should be displayed in graphical format
    And resource usage visualizations should be available
    And the charts should be interactive

  Scenario: Customize column visibility
    Given the user is on the Functional Test Insights view
    When the user modifies column visibility to hide a non-essential column
    Then the selected column should no longer be displayed
    And the customization should persist when navigating away and returning

  Scenario: Handle network error during data loading
    Given the user is on the Functional Test Insights view
    And the network connection is temporarily disconnected
    When the page attempts to load test data
    Then a user-friendly error message should be displayed
    And a retry option should be provided
    And the system should recover when the network is reconnected

  Scenario: Compare test results across different environments
    Given the user is on the Functional Test Insights view
    When the user selects two different environments for comparison
    Then differences in test status across environments should be highlighted
    And tests that pass in one environment but fail in another should be prominently displayed

  Scenario: Enable real-time updates for ongoing test runs
    Given the user is on the Functional Test Insights view
    When the user enables real-time update mode
    And a new Playwright test run is initiated
    Then in-progress tests should be visually distinguished
    And test results should appear in the view as they complete
    And summary statistics should update automatically

  Scenario Outline: Access Functional Test Insights with different user roles
    Given the user logs in with "<role>" permissions
    When the user attempts to access the Functional Test Insights view
    Then the user should see "<result>"
    And available actions should match the permission level

    Examples:
      | role      | result                                  |
      | admin     | full access with all configuration options |
      | read-only | view-only access with no modification options |
      | no-access | access denied message or login redirect |

  Scenario Outline: Verify responsive design at different screen sizes
    Given the viewport is set to "<dimensions>"
    When the user navigates to the Functional Test Insights view
    Then the layout should adjust appropriately to the screen size
    And all functionality should remain accessible

    Examples:
      | dimensions  |
      | 1920x1080   |
      | 1366x768    |
      | 768x1024    |
      | 375x667     |

  Scenario: Perform batch actions on multiple test results
    Given the user is on the Functional Test Insights view
    When the user selects 3 test results using the selection mechanism
    And the user applies batch tagging functionality
    Then the tags should be applied to all selected tests
    And the user should receive confirmation of the batch operation

  Scenario: Navigate between related tests of different types
    Given the user is on the Functional Test Insights view
    When the user identifies a functional test for a specific component
    And the user navigates to related unit tests for the same component
    Then appropriate context should be maintained
    And relevant tests should be displayed

  Scenario: Use visual comparison tool for visual regression tests
    Given the user is on the Functional Test Insights view
    When the user opens details for a test with visual differences detected
    And the user opens the visual comparison tool
    Then expected vs. actual images should be displayed side by side
    And differences should be highlighted
    And image manipulation tools should function correctly

  Scenario: Verify persistence of user preferences across sessions
    Given the user configures specific preferences in the Functional Test Insights view
    And the user logs out of the application
    When the user logs back in
    And navigates to the Functional Test Insights view
    Then all previously configured preferences should be maintained

  Scenario: Trigger re-execution of selected tests
    Given the user is on the Functional Test Insights view
    When the user selects multiple test cases
    And the user clicks the "Re-run Selected Tests" button
    And confirms the execution request
    Then the execution should be properly processed
    And feedback about execution status should be provided
    And results should be updated with the latest execution data

  Scenario Outline: Add and filter by custom tags
    Given the user is on the Functional Test Insights view
    When the user adds a custom tag "<tag>" to a test result
    And the user filters by the newly created tag
    Then only tests with that tag should be displayed

    Examples:
      | tag             |
      | critical-path   |
      | needs-review    |
      | flaky           |
      | performance     |

  Scenario: Deep linking to specific filtered view
    Given the user is on the Functional Test Insights view
    And specific filters are applied
    When the user copies the URL and opens it in a new tab
    Then the same filtered view should be displayed in the new tab

  Scenario Outline: Verify multi-language support
    Given the user has selected "<language>" as their preferred language
    When the user navigates to the Functional Test Insights view
    Then UI elements should be correctly translated
    And date formats should follow locale-specific conventions
    And all functionality should work correctly

    Examples:
      | language |
      | English  |
      | Spanish  |
      | Japanese |
      | Arabic   |

  Scenario: Identify and highlight flaky tests
    Given the user is on the Functional Test Insights view
    When the user examines tests with inconsistent results
    Then flaky tests should be clearly indicated with distinct visual markers
    And flakiness rate should be accurately calculated and displayed
    And test history should show the pattern of inconsistent results

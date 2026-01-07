Feature: Functional Test Insights View

  Background:
    Given the user has access to the application
    And Functional test results are available in the system
    And the user is logged in to the application

  Scenario: Access Insights View for Functional Tests
    When the user navigates to the Test Results dashboard
    And the user clicks on "Insights" section
    And the user clicks on "Functional Tests" option
    Then the Insights view for Functional tests should be displayed
    And the view should contain visualization of Functional test results
    And all navigation elements should be properly rendered and accessible
    And the UI/UX should be consistent with other test type Insights views

  Scenario: Verify Functional Test Insights Data Loading and Visualization
    When the user navigates to the Functional Test Insights view
    Then a data loading animation should be displayed while retrieving test results
    And all charts, graphs and visualizations should be properly rendered
    And the displayed data should match the actual Functional test results
    And summary statistics should accurately reflect the test execution results
    And no UI rendering issues or inconsistencies should be visible
    And visualizations should be interactive

  Scenario Outline: Filter and Search Functional Test Insights with Various Criteria
    Given the user is on the Functional Test Insights view
    When the user <action> with "<value>"
    Then the results should update to show only tests matching the criteria
    And visual indicators should show which filters are currently active

    Examples:
      | action                          | value                |
      | enters a search term            | login functionality  |
      | applies status filter           | failed               |
      | applies status filter           | passed               |
      | applies status filter           | skipped              |
      | applies test duration filter    | slow tests           |
      | applies test category filter    | UI navigation        |
      | applies date range filter       | last 7 days          |
      | applies multiple filters        | failed, last 7 days  |
      | clears all filters              |                      |

  Scenario: Cross-Comparison Between Test Types in Insights View
    Given the user is on the Insights dashboard
    When the user selects multiple test types for comparison including Functional tests
    And the user selects metrics to compare
    Then comparison view should load data from all selected test types
    And visual distinctions between different test types should be clear
    And metrics should be normalized where appropriate for fair comparison
    And cross-test type filters should apply correctly to all displayed data

  Scenario Outline: Export Functional Test Insights in Different Formats
    Given the user is on the Functional Test Insights view
    And the user has applied desired filters and configurations
    When the user clicks the export button
    And selects "<format>" as the export format
    Then the data should be exported in "<format>" format
    And the exported content should correctly capture the current view with all applied filters
    And the exported data should maintain accuracy compared to the displayed data

    Examples:
      | format |
      | PDF    |
      | CSV    |
      | PNG    |
      | Excel  |

  Scenario Outline: Share Functional Test Insights
    Given the user is on the Functional Test Insights view
    When the user clicks the share button
    And selects "<sharing_method>" as the sharing method
    And enters "<recipient>" information if required
    Then a shareable version of the insights should be created
    And recipients should be able to view the intended insights without permission issues

    Examples:
      | sharing_method | recipient       |
      | Email          | test@example.com |
      | Link           |                 |
      | Team channel   | QA Team         |

  Scenario: Performance Testing of Functional Test Insights with Large Datasets
    Given a large dataset of Functional test results is available
    When the user navigates to the Functional Test Insights view
    Then the initial page should load within 10 seconds
    And the UI should remain responsive during data loading
    And filtering operations should complete within 3 seconds
    And sorting operations should complete within 2 seconds
    And visualization transitions should be smooth
    And no browser performance warnings or errors should appear in console

  Scenario Outline: Error Handling in Functional Test Insights View
    Given the user is on the Functional Test Insights view
    When "<error_condition>" occurs
    Then a user-friendly error message should be displayed
    And appropriate recovery options should be available
    And the UI should not freeze or become unresponsive

    Examples:
      | error_condition                        |
      | no Functional test data is available   |
      | network interruption during data loading |
      | malformed test result data             |
      | server error during data requests      |
      | extremely slow server responses        |
      | access to non-existent test runs       |

  Scenario Outline: Verify Responsive Design of Functional Test Insights View
    Given the user accesses Functional Test Insights view
    When the screen size is "<screen_size>" or device is "<device_type>"
    Then the UI should adapt fluidly without horizontal scrolling
    And charts and visualizations should resize appropriately
    And navigation elements should transform into the appropriate format
    And no content should be cut off or inaccessible

    Examples:
      | screen_size | device_type |
      | 1920px      | desktop     |
      | 1440px      | desktop     |
      | 1024px      | tablet      |
      | 768px       | tablet      |
      | 480px       | mobile      |

  Scenario: Verify Functional Test-Specific Metrics and Visualizations
    When the user navigates to Functional Test Insights view
    Then the view should display Functional test-specific metrics
    And browser usage/compatibility visualizations should be available
    And user flow completion rates should be visible
    And page load time metrics across tested pages should be displayed
    And step-by-step success rates for multi-step tests should be shown
    And these metrics should be unique compared to other test types

  Scenario Outline: Verify Accessibility Compliance of Functional Test Insights View
    Given the user is on the Functional Test Insights view
    When the user interacts with the view using "<access_method>"
    Then all content should be accessible via this method
    And no critical or serious accessibility violations should be detected

    Examples:
      | access_method      |
      | keyboard navigation |
      | screen reader      |
      | high contrast mode |
      | zoom text only     |

  Scenario: Verify Data Accuracy in Functional Test Insights
    Given the user has access to raw Functional test result data
    When the user compares key metrics in the Insights view with manually calculated values
    Then all displayed metrics should match manually calculated values
    And individual test results should be correctly represented in visualizations
    And aggregated statistics should be mathematically sound
    And time-based trends should accurately reflect historical data

  Scenario: Real-time Updates in Functional Test Insights View
    Given the user is on the Functional Test Insights view
    When new Functional test results become available
    And the user clicks the refresh button
    Then the new test results should appear in the Insights view
    And the "last updated" indicator should show the current time
    And all calculations and aggregations should include the new data

  Scenario Outline: Role-Based Access for Functional Test Insights
    Given a user with "<role>" permissions
    When the user attempts to access the Functional Test Insights view
    Then the user should have access to "<accessible_features>"
    And should not have access to "<inaccessible_features>"

    Examples:
      | role           | accessible_features                                | inaccessible_features                  |
      | admin          | view data, export data, modify configurations      |                                        |
      | read-only user | view data                                          | export data, modify configurations     |
      | no permissions |                                                    | view data, export data, configurations |

  Scenario Outline: Configuration and Customization of Functional Test Insights View
    Given the user is on the Functional Test Insights view
    When the user accesses configuration options
    And changes "<setting_type>" to "<new_setting>"
    And saves the configuration
    Then the view should update to reflect the new configuration
    And the settings should persist between sessions for the same user
    And other users' settings should not be affected

    Examples:
      | setting_type     | new_setting       |
      | chart type       | bar chart         |
      | color scheme     | high contrast     |
      | default filters  | failed tests only |
      | layout           | compact view      |
      | metric threshold | 85% pass rate     |

  Scenario Outline: Cross-Browser Compatibility of Functional Test Insights View
    Given Functional test results are available
    When the user accesses the Functional Test Insights view using "<browser>"
    Then the view should load successfully
    And all functionality should work correctly
    And visual appearance should be consistent with minor acceptable variations
    And no browser-specific console errors should appear

    Examples:
      | browser        |
      | Chrome latest  |
      | Firefox latest |
      | Safari latest  |
      | Edge latest    |

  Scenario: Audit Trail for Functional Test Insights View
    Given audit trail functionality is enabled
    When the user performs various actions in the Functional Test Insights view
    Then each action should be recorded in the audit logs
    And each log entry should contain user ID, timestamp, action type, and relevant details
    And no sensitive data should appear unmasked in the audit logs

  Scenario: Integration with CI/CD Pipeline for Functional Test Insights
    Given a CI/CD pipeline is configured to run Functional tests
    When the pipeline completes execution with new test results
    And the user navigates to Functional Test Insights view
    Then the latest test results from the pipeline should be visible
    And pipeline metadata should be correctly associated with test results
    And test execution timestamp should match pipeline execution time

  Scenario Outline: Historical Trend Analysis in Functional Test Insights
    Given the user is on the Functional Test Insights view
    When the user selects trend analysis for "<time_period>"
    Then historical trend charts should render correctly
    And data points should correspond to actual historical test results
    And statistical analysis should be calculated correctly

    Examples:
      | time_period   |
      | last week     |
      | last month    |
      | last quarter  |
      | custom range  |

  Scenario: Custom Dashboard Creation with Functional Test Insights
    Given the user has dashboard creation permissions
    When the user creates a new custom dashboard
    And adds widgets from Functional Test Insights
    And arranges widgets in a custom layout
    And saves the custom dashboard
    Then the dashboard should save successfully
    And when accessed later, the dashboard should load correctly
    And widgets should maintain their functionality
    And dashboard layout should persist as configured

  Scenario: Test Flakiness Detection in Functional Test Insights
    Given the user is on the Functional Test Insights view
    When the user views flakiness metrics
    Then flaky tests should be correctly identified based on inconsistent results
    And flakiness metrics should be calculated accurately
    And individual test flakiness history should show pattern of inconsistent results
    And tests that consistently pass or fail should not be flagged as flaky

  Scenario Outline: Setting Up Notifications for Functional Test Insights
    Given the user is on the Functional Test Insights view
    When the user accesses notification configuration
    And sets up alerts for "<condition>" to be delivered via "<channel>"
    And a situation occurs that meets the alert condition
    Then a notification should be delivered through the configured channel
    And the notification content should be accurate and contain relevant information

    Examples:
      | condition                     | channel |
      | test failure threshold        | email   |
      | performance degradation       | in-app  |
      | flaky test detected           | Slack   |
      | regression detected           | email   |
      | duration anomaly              | in-app  |

  Scenario: Root Cause Analysis in Functional Test Insights
    Given the user is on the Functional Test Insights view
    When the user selects a failed test case
    And accesses root cause analysis features
    Then common failure patterns should be correctly identified
    And related failures should be linked appropriately
    And relevant failure artifacts should be accessible
    And error messages should be properly parsed and presented
    And screenshots at failure point should be available and viewable

  Scenario: Regression Analysis for Functional Test Insights
    Given the user is on the Functional Test Insights view
    When the user accesses regression analysis section
    Then tests flagged as regressions should be correctly identified
    And regression detection timeframe should be reasonable
    And historical view should show when tests started failing
    And regression severity should be indicated based on impact or frequency

  Scenario: Test Duration Analysis in Functional Test Insights
    Given the user is on the Functional Test Insights view
    When the user views test duration metrics
    Then test durations should be displayed accurately
    And slow tests should be correctly identified
    And duration trends should show correct pattern of execution time changes
    And statistical analysis of durations should be accurate
    And anomalous duration changes should be flagged appropriately

  Scenario: Integration with Test Case Management for Functional Test Insights
    Given Functional tests are linked to test cases in a test management system
    When the user views these tests in the Functional Test Insights view
    Then test case references and IDs should be displayed
    And test case metadata should be visible in Insights
    And links to test cases should be functional
    And test case coverage metrics should be correctly calculated

  Scenario: Browser-Specific Analysis in Functional Test Insights
    Given Functional tests have been executed across multiple browsers
    When the user views browser comparison visualizations
    Then differences between browsers should be clearly shown
    And browser-specific failures should be correctly identified
    And performance metrics should show accurate comparison across browsers
    And screenshot comparisons across browsers should be available for failures

  Scenario: Environment-Based Analysis in Functional Test Insights
    Given Functional tests have been executed across multiple environments
    When the user views environment comparison features
    Then differences between environments should be clearly shown
    And environment-specific failures should be properly categorized
    And performance comparison across environments should be accurate
    And environment configuration details should be accessible when needed

  Scenario Outline: Multi-Language Support in Functional Test Insights
    Given the system is configured with multiple language options
    When the user changes language settings to "<language>"
    Then all UI elements should be correctly translated
    And date and time formats should follow locale-specific conventions
    And number formatting should be locale-appropriate

    Examples:
      | language |
      | English  |
      | Spanish  |
      | Japanese |
      | Arabic   |

  Scenario: Data Retention for Functional Test Insights
    Given data retention policies are configured for Functional Test Insights
    When the user reviews available historical data
    Then the oldest available data should align with retention policy timeframe
    And data beyond retention period should be either archived or properly removed
    And archived data should be accessible through appropriate interfaces when needed

  Scenario Outline: Advanced Search in Functional Test Insights
    Given the user is on the Functional Test Insights view
    When the user performs an advanced search using "<search_criteria>"
    Then the search results should contain only tests matching the criteria
    And complex searches should complete within 3 seconds

    Examples:
      | search_criteria                                         |
      | test name contains "login" AND status equals "failed"   |
      | execution time > 5s OR test name contains "performance" |
      | browser = "Chrome" AND environment = "staging"          |
      | failed in last 7 days AND previously passing            |
      | contains special characters like "%" AND "#"            |

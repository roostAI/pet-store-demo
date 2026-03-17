Feature: Insights View Integration with Playwright Functional Tests

  Background:
    Given the Playwright functional test framework is set up
    And access to the codebase where Insights view is implemented for other test types
    And developer permissions to modify the Playwright configuration

  @api
  Scenario: Integration of Insights View into Playwright Functional Tests
    When I add the necessary Insights view imports to the Playwright test configuration file
    And I configure the Insights view plugin in the Playwright setup
    And I add initialization code in the global setup file
    And I create a simple test that executes a basic UI interaction
    And I run the test with Insights view enabled
    Then the test should execute successfully without errors
    And the Insights view should appear during or after test execution
    And the Insights panel should contain the correct test information and results
    And the core test functionality should not be affected by the Insights view integration

  @api
  Scenario Outline: Data Population and Consistency in Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    When I create a functional test with <interaction_type> interactions
    And I include <assertion_type> assertions in the test
    And I include network request validations
    And I trigger console logs during test execution
    And I run the test with Insights view enabled
    Then all UI interactions should be recorded and displayed chronologically in the Insights view
    And screenshots should be captured at key steps and displayed
    And network requests triggered during test execution should be visible
    And console logs should be captured and displayed
    And all test assertions and their results should be correctly shown

    Examples:
      | interaction_type | assertion_type |
      | click            | element        |
      | form filling     | text content   |
      | navigation       | visibility     |
      | drag-and-drop    | attribute      |
      | hover            | count          |

  @api
  Scenario Outline: Performance Impact of Insights View on Test Execution
    Given Insights view is successfully integrated with Playwright functional tests
    And a substantial functional test suite exists
    When I run the functional test suite with Insights view <status>
    And I record the execution time and memory usage
    Then the performance difference between tests with and without Insights view should be minimal
    And memory usage should remain stable during extended test runs
    And no memory leaks should be detected during extended test execution
    And system resources usage should remain within acceptable limits

    Examples:
      | status   |
      | disabled |
      | enabled  |

  @api
  Scenario Outline: Cross-browser Compatibility of Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    And Playwright is configured to run tests on multiple browsers
    When I create a functional test that performs various UI interactions and assertions
    And I run the test with Insights view enabled on <browser>
    Then Insights view should load and function correctly
    And the layout, styling, and interactive elements should be consistent
    And all data should be correctly captured and displayed
    And no browser-specific console errors or rendering issues should be observed

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  @api
  Scenario Outline: Error Handling and Edge Cases for Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    When I create a functional test that <error_condition>
    And I run the test with Insights view enabled
    Then <expected_outcome>
    And the Insights view should not crash or become unusable

    Examples:
      | error_condition                           | expected_outcome                                                            |
      | deliberately fails an assertion            | failed assertions should be clearly highlighted with relevant error details |
      | encounters a network error                 | network errors should be properly captured with appropriate error information |
      | triggers JavaScript exceptions on the page | JavaScript exceptions should be recorded and shown with stack traces        |
      | contains extremely large data output       | large data sets should be handled efficiently                              |
      | abruptly terminates                        | the Insights view should either recover gracefully or provide meaningful error information |

  @api
  Scenario Outline: Configuration Options and Customization for Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    And documentation of available configuration options from existing implementations
    When I create a functional test with default Insights view configuration
    And I modify the configuration to <configuration_change>
    And I run the test with the modified configuration
    Then the configuration change should be correctly applied to the Insights view
    And the configuration change should not negatively impact test execution or results reporting

    Examples:
      | configuration_change                                |
      | change the display position of the Insights panel    |
      | hide network requests section                        |
      | hide console logs section                            |
      | set custom screenshot capture frequency              |
      | configure custom data collection options             |

  @api
  Scenario: Integration of Insights View with CI/CD Pipeline
    Given Insights view is successfully integrated with Playwright functional tests
    And CI/CD pipeline setup for running Playwright tests
    When I configure the CI/CD pipeline to run tests with Insights view enabled
    And I set up the pipeline to run tests in headless mode
    And I configure the pipeline to store Insights view reports as artifacts
    And I trigger a pipeline run with a functional test suite
    Then tests should execute successfully in the CI/CD environment
    And Insights data should be captured correctly in headless mode
    And Insights reports should be properly generated and stored as pipeline artifacts
    And the reports should contain all expected data
    And reports should be accessible and readable after the pipeline run completes

  @api
  Scenario Outline: Data Filtering and Search Capabilities in Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    And a functional test that generates substantial data
    When I run a complex functional test with the Insights view enabled
    And I use the search functionality to find <search_term>
    And I apply filters to <filter_action>
    Then search functionality should correctly find and highlight matching items
    And filters should correctly limit the displayed data based on selected criteria
    And navigation controls should allow efficient movement between different sections
    And large datasets should be handled efficiently
    And filter and search states should be preserved when switching between sections
    And UI should remain responsive when interacting with large datasets

    Examples:
      | search_term         | filter_action                               |
      | "specific actions"  | show only failed assertions                 |
      | "assertion results" | show only network requests with 404 status  |
      | "error messages"    | show only console errors                    |
      | "button click"      | show only UI interactions                   |
      | "form submission"   | show only network requests with POST method |

  @api
  Scenario: Accessibility of Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    And access to accessibility testing tools and screen readers
    When I run a functional test with Insights view enabled
    And I test keyboard navigation through all interactive elements
    And I use a screen reader to navigate through the Insights view
    And I verify proper semantic HTML structure with accessibility testing tools
    And I check color contrast ratios for text and interactive elements
    Then all interactive elements should be keyboard accessible
    And focus indicators should be clearly visible when navigating with keyboard
    And screen readers should be able to access and announce all relevant information
    And HTML structure should include appropriate ARIA attributes and semantic elements
    And color contrast should meet WCAG AA standards
    And no accessibility violations should be detected by automated testing tools

  @api
  Scenario Outline: Responsive Design of Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    And capability to run tests with different viewport sizes
    When I run a functional test with Insights view enabled
    And I resize the browser window to <viewport_size>
    And I interact with all sections and features of the Insights view
    Then the Insights view layout should adapt appropriately
    And no horizontal scrolling should be required
    And all features and data should remain accessible
    And interactive elements should remain usable and not overlap
    And text should remain readable
    And responsive design breakpoints should transition smoothly without layout issues

    Examples:
      | viewport_size     |
      | 1920x1080        |
      | 1366x768         |
      | 1024x768         |
      | 768x1024         |

  @api
  Scenario: Real-time Data Updates in Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    And a multi-step functional test with delays between actions
    When I enable real-time updates in the Insights view configuration
    And I run the test and observe the Insights view during execution
    Then the Insights view should update progressively as each step executes
    And new screenshots should appear shortly after each step completion
    And network requests should be logged in real-time as they occur
    And assertion results should appear immediately after each assertion is evaluated
    And the UI should remain responsive during updates
    And no significant test execution delay should occur due to real-time updates

  @api
  Scenario: Compatibility with Parallel Test Execution
    Given Insights view is successfully integrated with Playwright functional tests
    And Playwright is configured to support parallel test execution
    And multiple test files are available for execution
    When I configure Playwright to run multiple test files in parallel with Insights view enabled
    And I set up unique identifiers for each parallel test
    And I execute at least 5 different functional tests simultaneously
    Then each parallel test execution should have its own separate Insights view instance
    And test data from different parallel executions should not be mixed or corrupted
    And the Insights view should provide a mechanism to select specific test executions
    And performance should remain stable with multiple Insights view instances
    And all data should be correctly associated with its respective test execution
    And the UI should clearly indicate which test execution is currently being viewed

  @api
  Scenario Outline: Insights View Report Export and Sharing
    Given Insights view is successfully integrated with Playwright functional tests
    And a functional test has generated comprehensive data in the Insights view
    When I locate and use the export functionality in the Insights view UI
    And I export the test results in <format> format
    And I verify the exported file by opening it
    Then export options should be available and accessible
    And the export should contain all test data including screenshots, logs, and assertion results
    And the export should be properly formatted
    And the export should correctly represent the visual state of the Insights view

    Examples:
      | format |
      | HTML   |
      | PDF    |
      | JSON   |

  @api
  Scenario: Visual Comparison Capabilities in Insights View
    Given Insights view is successfully integrated with Playwright functional tests
    And visual comparison functionality is implemented
    When I execute a functional test that captures multiple screenshots
    And I save the current test run screenshots as baseline images
    And I make visual changes to the application under test
    And I re-run the same functional test to capture new screenshots
    And I use the visual comparison features to compare new screenshots with baseline
    Then the Insights view should provide functionality to compare screenshots visually
    And visual differences should be highlighted or indicated clearly
    And the comparison tool should provide options to adjust sensitivity/threshold
    And users should be able to zoom in and navigate within the comparison view
    And the comparison tool should handle various types of visual changes
    And false positives should be minimized with appropriate threshold settings

  @api
  Scenario: Persistency and History of Insights View Data
    Given Insights view is successfully integrated with Playwright functional tests
    And data persistence mechanism is implemented for Insights view
    When I run a functional test with Insights view enabled
    And I verify the initial data capture
    And I close the browser or test runner completely
    And I re-open the test environment and access the Insights view history section
    And I locate and open the previously executed test results
    And I run the same test again with some variation
    Then test execution history should be persistent and available after reopening
    And previous test runs should be properly cataloged with timestamps and identifiers
    And all data from previous test executions should be preserved and accessible
    And the history view should provide adequate filtering and search capabilities
    And comparison features should correctly highlight differences between test runs

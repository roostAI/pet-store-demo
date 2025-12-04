Feature: Insights Dashboard Functional Test Display and Management
  As a user of the Insights dashboard
  I want to view and interact with functional test results
  So that I can analyze test outcomes and make informed decisions

  Background:
    Given I am logged into the application
    And functional tests have been executed with known results

  @ui @smoke
  Scenario: Display of functional tests in Insights view
    When I navigate to the Insights dashboard
    Then I should see the Functional Tests section
    And functional tests should be displayed similar to Unit, Integration, and API tests

  @ui
  Scenario Outline: Verify functional test results accuracy
    Given <number> Playwright functional tests have been executed with <status> results
    When I navigate to the Insights view
    Then the displayed results should exactly match the actual Playwright execution outcomes
    And the count of <status> tests should be <number>

    Examples:
      | number | status  |
      | 5      | passing |
      | 3      | failing |
      | 2      | skipped |

  @ui
  Scenario Outline: Filter functional tests by different criteria
    Given multiple functional tests with different statuses exist in the system
    When I navigate to the Insights view
    And I apply filter "<filter_type>" with value "<filter_value>"
    Then only functional tests matching the "<filter_value>" criteria should be displayed

    Examples:
      | filter_type | filter_value |
      | status      | passed       |
      | status      | failed       |
      | status      | skipped      |
      | test_name   | login        |
      | duration    | >5s          |
      | duration    | <1s          |

  @ui
  Scenario: View detailed information for a specific functional test
    When I navigate to the Insights view
    And I select a specific functional test
    And I click to view detailed information
    Then I should see detailed test information including:
      | Detail Type      |
      | Execution time   |
      | Duration         |
      | Steps executed   |
      | Errors (if any)  |
      | Screenshots      |
      | Execution logs   |

  @ui
  Scenario: Compare current functional test results with historical data
    Given multiple executions of functional tests are available in the system
    When I navigate to the Insights view
    And I select to compare current results with a previous execution
    Then I should see a comparison view
    And changes in pass/fail status should be highlighted
    And changes in execution times should be visible

  @ui
  Scenario Outline: Verify integration with other test types
    When I navigate to the Insights view
    And I select the "<view_type>" view option
    Then I should see <visibility> functional tests in the display
    And I should see <aggregation> metrics including functional tests

    Examples:
      | view_type            | visibility            | aggregation       |
      | All Tests            | all                   | combined          |
      | Functional Tests     | only functional       | functional-only   |
      | Unit Tests           | no                    | unit-only         |
      | Combined Test Report | functional with other | all test types    |

  @non-functional @performance
  Scenario Outline: Verify performance impact of functional tests in Insights view
    Given the Insights view contains <test_count> functional tests
    When I load the Insights dashboard
    Then the page should load in less than <max_load_time> seconds
    And UI interactions should remain responsive

    Examples:
      | test_count | max_load_time |
      | 100        | 3             |
      | 500        | 4             |
      | 1000       | 5             |

  @non-functional @scalability
  Scenario Outline: Verify scalability with large number of functional tests
    Given the system has <test_count> functional tests
    When I navigate to the Insights view
    Then the page should load in less than 5 seconds
    And scrolling through the test list should be smooth
    And filtering operations should complete in less than 2 seconds

    Examples:
      | test_count |
      | 100        |
      | 500        |
      | 1000       |
      | 2000       |

  @non-functional @visual
  Scenario Outline: Verify visual consistency across test types
    When I navigate to the Insights view
    Then functional tests should have the same visual style as <other_test_type> tests
    And status color coding should be consistent across all test types
    And layout structure should be consistent across all test types

    Examples:
      | other_test_type |
      | unit            |
      | integration     |
      | API             |

  @ui @playwright-specific
  Scenario Outline: Access Playwright-specific artifacts in functional test insights
    Given functional tests with <artifact_type> have been executed
    When I navigate to the Insights view
    And I select a functional test with <artifact_type>
    Then I should be able to <action> the <artifact_type>

    Examples:
      | artifact_type | action    |
      | screenshots   | view      |
      | videos        | play      |
      | traces        | open in viewer |

Feature: Playwright Insights View for Functional Tests

  # UI Test Scenarios
  @ui
  Scenario: Verify Playwright Insights View Integration for Functional Tests
    Given functional tests are configured and executed in the system
    When I execute a set of functional tests using Playwright
    And I navigate to the insights view section
    Then I should see the insights for the executed functional tests displayed
    And the insights view should display accurate and complete data integrated seamlessly with existing insights

  @ui
  Scenario Outline: Boundary Value Analysis for Numeric Fields in Insights
    Given functional tests with numeric data fields are available
    When I identify numeric fields in the insights view
    And I input boundary values <boundary_value>
    Then the insights view should handle these values correctly without errors

    Examples:
      | boundary_value |
      | minimum        |
      | maximum        |
      | just above min |
      | just below max |

  @ui
  Scenario: State Transition Testing for Workflow Changes
    Given workflows with defined state transitions are set up
    When I execute a workflow with multiple state transitions
    And I navigate to the Playwright insights view
    Then each state transition should be accurately reflected in the insights

  @ui
  Scenario Outline: Decision Table Testing for Role-Based Access
    Given user roles and permissions are configured in the system
    When I attempt to access the insights view with <user_role>
    Then access should be <access_result> based on role permissions

    Examples:
      | user_role | access_result |
      | Admin     | granted       |
      | User      | granted       |
      | Guest     | denied        |

  @ui
  Scenario: Data Integrity and Consistency Checks
    Given functional tests are executed and results are available
    When I navigate to the Playwright insights view
    Then the insights data should consistently reflect the actual results of the functional tests

  @ui
  Scenario: Alert Classification and Override Validation
    Given alerts are configured to trigger based on specific conditions in functional tests
    When I execute functional tests that trigger alerts
    And I navigate to the Playwright insights view
    Then alerts should be correctly classified
    And I should be able to override alerts and confirm the changes are reflected

  @ui
  Scenario: End-to-End Workflow Test for Insights Generation
    Given functional tests are set up and ready for execution
    When I initiate a functional test
    And allow the test to complete and generate insights
    And I navigate to the insights view
    Then the insights view should accurately and completely reflect the results of the functional test
    And all intermediate actions like saves, validations, recalculations, and alerts should be correctly processed

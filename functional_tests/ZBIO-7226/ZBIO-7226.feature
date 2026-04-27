Feature: Functional Test Insights View

  Background:
    Given the user has access to the test insights dashboard
    And functional test results are available in the system

  @ui @initialization
  Scenario: Initialization of Insights View for Functional Tests
    When the user navigates to the test insights dashboard
    And selects the "Functional Tests" category
    Then the insights view should initialize without errors
    And all UI components should render correctly
    And a loading indicator should be displayed while data is being fetched
    And functional test data should be visible once loaded

  @ui @integration
  Scenario Outline: Integration with Existing Test Types in Insights View
    When the user navigates to the test insights dashboard
    Then a navigation option for "<test_type>" tests should exist
    When the user selects the "<test_type>" test type
    Then the UI layout should be consistent with other test type views
    And the view should display data specific to the "<test_type>" test type

    Examples:
      | test_type   |
      | Functional  |
      | Unit        |
      | Integration |
      | API         |

  @ui @visualization
  Scenario Outline: Verification of Data Visualization Components
    When the user navigates to the functional test insights view
    Then the "<visualization_component>" should be present
    And the "<visualization_component>" should accurately display test data
    When the user interacts with the "<visualization_component>"
    Then the component should respond with appropriate information
    And the data displayed should match the raw test results

    Examples:
      | visualization_component |
      | Pass Rate Chart         |
      | Failure Distribution    |
      | Test Duration Graph     |
      | Status Summary Table    |
      | Trend Analysis Chart    |

  @ui @filtering
  Scenario Outline: Filtering Capabilities in Functional Test Insights
    Given the user is on the functional test insights view
    When the user applies a filter by "<filter_type>" with value "<filter_value>"
    Then the view should display only tests matching the "<filter_value>" criteria
    When the user clears the filter
    Then all test results should be visible again

    Examples:
      | filter_type    | filter_value |
      | Test Status    | Failed       |
      | Test Status    | Passed       |
      | Test Category  | Critical     |
      | Date Range     | Last Week    |
      | Test Component | UI           |

  @ui @sorting
  Scenario Outline: Sorting Capabilities in Functional Test Insights
    Given the user is on the functional test insights view
    When the user sorts the data by "<sort_column>" in "<sort_direction>" order
    Then the data should be displayed in "<sort_direction>" order based on "<sort_column>"

    Examples:
      | sort_column       | sort_direction |
      | Test Name         | ascending      |
      | Test Name         | descending     |
      | Execution Time    | ascending      |
      | Execution Time    | descending     |
      | Last Run Status   | ascending      |
      | Last Run Status   | descending     |
      | Failure Frequency | ascending      |
      | Failure Frequency | descending     |

  @ui @error-handling
  Scenario Outline: Error Handling and Edge Cases in Functional Test Insights
    Given the user is on the functional test insights view
    When the system encounters a "<condition>" condition
    Then the system should display an appropriate "<message_type>" message
    And the view should recover gracefully when the error condition resolves

    Examples:
      | condition                    | message_type        |
      | No test results available    | Empty state         |
      | Network failure during load  | Connection error    |
      | Extremely large result set   | Loading indicator   |
      | Malformed test result data   | Data error          |
      | All tests passing            | Success information |
      | All tests failing            | Failure information |

  @ui @responsive-design
  Scenario Outline: Responsiveness of Insights View Across Different Screen Sizes
    Given the user is on the functional test insights view
    When the viewport size is set to "<device>" dimensions
    Then all visualization components should render correctly
    And navigation elements should remain accessible
    And interactive elements should remain functional
    And data should be readable without horizontal scrolling

    Examples:
      | device       |
      | Desktop      |
      | Laptop       |
      | Tablet       |
      | Mobile       |

  @ui @accessibility
  Scenario Outline: Accessibility Compliance of Functional Test Insights View
    Given the user is on the functional test insights view
    When accessibility is tested for "<accessibility_feature>"
    Then the page should comply with WCAG 2.1 AA standards for "<accessibility_feature>"

    Examples:
      | accessibility_feature |
      | Keyboard navigation   |
      | Screen reader         |
      | Color contrast        |
      | ARIA attributes       |
      | Focus management      |

  @ui @export
  Scenario Outline: Export and Sharing Capabilities for Functional Test Insights
    Given the user is on the functional test insights view
    When the user selects to export data in "<format>" format
    Then the system should generate a downloadable file in "<format>" format
    And the exported data should match what's displayed in the UI
    And the formatting should be appropriate for the "<format>"

    Examples:
      | format     |
      | CSV        |
      | Excel      |
      | PDF        |
      | JSON       |

  @ui @sharing
  Scenario: Sharing Functional Test Insights
    Given the user is on the functional test insights view
    When the user selects to share the current view
    Then a shareable link should be generated
    When another user opens the shared link
    Then they should see the same view with the same filters and data

  @ui @historical-trends
  Scenario Outline: Historical Trending of Functional Test Results
    Given the user is on the functional test insights view
    When the user selects to view trends for "<time_period>"
    Then the view should display historical trends for the selected period
    And performance changes over time should be clearly visualized
    And statistical indicators should identify significant changes

    Examples:
      | time_period |
      | Last Week   |
      | Last Month  |
      | Last Quarter|
      | Last Year   |
      | Custom Range|

  @ui @cross-browser
  Scenario Outline: Cross-Browser Compatibility of Functional Test Insights View
    Given the test is running on "<browser>"
    When the user navigates to the functional test insights view
    Then all visualization components should render correctly
    And interactive elements should function as expected
    And the layout should be consistent with other browsers

    Examples:
      | browser |
      | Chrome  |
      | Firefox |
      | Safari  |
      | Edge    |

  @ui @real-time
  Scenario: Real-time Update of Functional Test Insights During Test Execution
    Given the user is on the functional test insights view
    And a functional test run is initiated
    When tests are executed and completed
    Then the insights view should update in real-time without manual refresh
    And completed tests should appear with their correct status
    And progress indicators should accurately reflect the current state

  @ui @customization
  Scenario: Customizable Dashboard for Functional Test Insights
    Given the user is on the functional test insights view
    When the user activates dashboard customization mode
    Then they should be able to add new visualization components
    And remove existing components from the dashboard
    And rearrange components by drag and drop
    And resize visualization components
    When the user saves the customized dashboard
    And reloads the page
    Then the customizations should persist
    When the user resets the dashboard to default settings
    Then the default configuration should be restored

  @ui @advanced-analytics
  Scenario Outline: Advanced Analytics and Machine Learning Insights for Functional Tests
    Given the user is on the functional test insights view
    When the user navigates to the advanced analytics section
    Then the system should display "<insight_type>" based on test data analysis
    And the insights should be actionable with relevant context

    Examples:
      | insight_type               |
      | Flaky test identification  |
      | Failure prediction         |
      | Test execution time trends |
      | Optimization recommendations|

  @ui @ci-cd-integration
  Scenario: Integration with CI/CD Pipeline Metrics
    Given the user is on the functional test insights view
    When the user views test results in the CI/CD context
    Then test results should be correlated with pipeline events
    And users should be able to filter results by pipeline, branch, or deployment
    And failed tests should link to relevant code changes
    And pipeline health metrics should incorporate functional test status

  @ui @collaboration
  Scenario Outline: Collaboration and Commenting Features
    Given the user is on the functional test insights view
    When the user adds a comment to a "<test_element>"
    Then the comment should be saved and displayed
    When the user tags another team member in the comment
    Then a notification should be sent to the tagged user
    And the comment should be visible to other team members

    Examples:
      | test_element      |
      | Failed test       |
      | Chart             |
      | Trend analysis    |
      | Test result table |

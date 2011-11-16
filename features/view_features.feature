Feature: View Features

  In order to see which features are available for access
  As an admin
  I want to view all installed features

  Scenario: List Features
    Given a feature exists with a name of "Manage Users"
    And a feature exists with a name of "Manage Roles"
    When I go to the list of features
    Then I should see "Manage Users"
    And I should see "Manage Roles"

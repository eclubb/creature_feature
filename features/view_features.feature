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

  Scenario: Feature List Includes Associated Roles
    Given a role with a feature exists with a name of "Admin"
    And a role with a feature exists with a name of "User"
    When I go to the list of features
    Then I should see "Manage Users"
    And I should see "Admin"
    And I should see "User"

  Scenario: Feature List Sorts Associated Roles Alphabetically
    Given a role with a feature exists with a name of "User"
    And a role with a feature exists with a name of "Admin"
    When I go to the list of features
    Then I should see "Admin, User"

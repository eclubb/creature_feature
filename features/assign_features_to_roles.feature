Feature: Assign Features to Roles

  In order to build up a role
  As an admin
  I want to manage which features are assigned to a role

  Background:
    Given the following features exist:
      | Name         |
      | Manage Users |
      | Manage Roles |

  Scenario: Assign a Feature to a New Role
    When I go to the list of roles
    And I follow "New Role"
    And I fill in "Name" with "Admin"
    And I check "Manage Users"
    And I press "Save"
    Then I should see "Manage Users"
    But I should not see "Manage Roles"

  Scenario: Assign a Read-Only Feature to a New Role
    When I go to the list of roles
    And I follow "New Role"
    And I fill in "Name" with "Admin"
    And I check "Manage Users"
    And I check "Read-Only"
    And I press "Save"
    Then I should see "Manage Users (Read-Only)"

  Scenario: Assign a Feature to an Existing Role
    Given a role with a feature exists with a name of "Admin"
    When I go to the list of roles
    And I follow "Edit"
    Then the "Manage Users" checkbox should be checked
    And the "Manage Roles" checkbox should not be checked
    And I check "Manage Roles"
    And I press "Save"
    Then I should see "Manage Users"
    And I should see "Manage Roles"

  Scenario: Remove a Feature from an Existing Role
    Given a role with two features exists with a name of "Admin"
    When I go to the list of roles
    And I follow "Edit"
    Then the "Manage Users" checkbox should be checked
    And the "Manage Roles" checkbox should be checked
    And I uncheck "Manage Roles"
    And I press "Save"
    Then I should see "Manage Users"
    But I should not see "Manage Roles"

  Scenario: Make a Read-Only Feature Writeable
    Given a role with a read only feature exists with a name of "Admin"
    When I go to the list of roles
    And I follow "Edit"
    Then the "Manage Users" checkbox should be checked
    And the "Read-Only" checkbox should be checked
    And I uncheck "Read-Only"
    And I press "Save"
    Then I should see "Manage Users"

  Scenario: Make a Writeable Feature Read-Only
    Given a role with a feature exists with a name of "Admin"
    When I go to the list of roles
    And I follow "Edit"
    Then the "Manage Users" checkbox should be checked
    And the "Read-Only" checkbox should not be checked
    And I check "Read-Only"
    And I press "Save"
    Then I should see "Manage Users (Read-Only)"

  Scenario: Remove all Features from an Existing Role
    Given a role with a feature exists with a name of "Admin"
    When I go to the list of roles
    And I follow "Edit"
    Then the "Manage Users" checkbox should be checked
    And the "Manage Roles" checkbox should not be checked
    And I uncheck "Manage Users"
    And I press "Save"
    Then I should not see "Manage Users"
    And I should not see "Manage Roles"

  Scenario: Role Sorts Features Alphabetically
    Given a role with two features exists with a name of "Admin"
    When I go to the list of roles
    And I follow "Show"
    Then I should see "Manage Roles, Manage Users"

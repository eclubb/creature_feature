Feature: Manage Roles

  In order to control which roles are available for users
  As an admin
  I want to create and manage roles

  Scenario: List Roles
    Given a role exists with a name of "Admin"
    And a role exists with a name of "Manager"
    When I go to the list of roles
    Then I should see "Admin"
    And I should see "Manager"

  Scenario: Create Valid Role
    When I go to the list of roles
    And I follow "New Role"
    And I fill in "Name" with "Admin"
    And I press "Save"
    Then I should see "Role was successfully created."
    Then I should see "Admin"
    And I should have 1 role

  Scenario: Create Invalid Role (without name)
    When I go to the list of roles
    And I follow "New Role"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 roles

  Scenario: Create Invalid Role (duplicate name)
    Given a role exists with a name of "Admin"
    When I go to the list of roles
    And I follow "New Role"
    And I fill in "Name" with "Admin"
    And I press "Save"
    Then I should see "Name has already been taken"
    And I should have 1 roles

  Scenario: Edit Role
    Given a role exists with a name of "Admin"
    When I go to the list of roles
    And I follow "Edit"
    Then the "Name" field should contain "Admin"
    And I fill in "Name" with "Manager"
    And I press "Save"
    Then I should see "Role was successfully updated."
    And I should see "Manager"
    And I should not see "Admin"

  Scenario: Edit Role to Become Invalid (without name)
    Given a role exists with a name of "Admin"
    When I go to the list of roles
    And I follow "Edit"
    Then the "Name" field should contain "Admin"
    And I fill in "Name" with ""
    And I press "Save"
    Then I should see "Name can't be blank"

  Scenario: Show Role
    Given a role exists with a name of "Manager"
    When I go to the list of roles
    And I follow "Show"
    Then I should see "Manager"

  Scenario: Delete Role
    Given a role exists
    When I go to the list of roles
    And I follow "Destroy"
    Then I should have no roles

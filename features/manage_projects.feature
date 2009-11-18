Feature: Manage projects
  In order to keep track of various projects
  a developer
  wants to create, edit, delete and list his/her projects
  
  Scenario: Register new project
    Given I am on the new project page
    When I fill in "Name" with "Trivial Timer in Rails"
    And I select "2009-8-31" as the date
    And I fill in "Project Status" with "started"
    And I press "Create"
    Then I should see "Trivial Timer in Rails"
    And I should see "2009-08-31"
    And I should see "started"

  Scenario: Edit an existing project
    Given the following projects:
      |name|start_date|project_status|
      |Trivial Timer in Rails|2009-08-31|started|
      |Trivial Timer in Django|2009-09-07|planning|
      |Trivial Timer in SproutCore|2009-09-14|planning|
      |Trivial Timer in RestfulX|2009-09-21|planning|
    And I am on the project listings page
    When I choose to "Edit" the 3rd project
    When I fill in "Name" with "Trivial Timer in Seaside"
    And I select "2009-10-31" as the date
    And I fill in "Project Status" with "started"
    And I press "Update"
    Then I should see "Trivial Timer in Seaside"
    And I should see "2009-10-31"
    And I should see "started"

  Scenario: Delete project
    Given the following projects:
      |name|start_date|project_status|
      |Trivial Timer in Rails|2009-08-31|started|
      |Trivial Timer in Django|2009-09-7|planning|
      |Trivial Timer in SproutCore|2009-09-14|planning|
      |Trivial Timer in RestfulX|2009-09-21|planning|
    When I choose to "Destroy" the 3rd project
    Then I should see the following projects:
      |name|start_date|project_status|
      |Trivial Timer in Rails|2009-08-31|started|
      |Trivial Timer in Django|2009-09-07|planning|
      |Trivial Timer in RestfulX|2009-09-21|planning|

  Scenario: List projects
    Given the following projects:
      |name|start_date|project_status|
      |Trivial Timer in Rails|2009-08-31|started|
      |Trivial Timer in Django|2009-09-07|planning|
      |Trivial Timer in SproutCore|2009-09-14|planning|
      |Trivial Timer in RestfulX|2009-09-21|planning|
    And I am on the project listings page
    Then I should see the following projects:
      |name|start_date|project_status|
      |Trivial Timer in Rails|2009-08-31|started|
      |Trivial Timer in Django|2009-09-07|planning|
      |Trivial Timer in SproutCore|2009-09-14|planning|
      |Trivial Timer in RestfulX|2009-09-21|planning|

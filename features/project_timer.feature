Feature: Time sessions spent working on a project
  In order to keep track of time spent on projects
  a developer
  wants to time work sessions

  Scenario: Time a session
    Given the following projects:
      |name|start_date|project_status|
      |Trivial Timer in Rails|2009-08-31|started|
      |Trivial Timer in Django|2009-09-07|planning|
      |Trivial Timer in SproutCore|2009-09-14|planning|
      |Trivial Timer in RestfulX|2009-09-21|planning|
    And I am on the project listings page
    When I choose to "Open" the 3rd project
    Then I should see "Trivial Timer in SproutCore"
    When I press "Start Timer"
    Then I should see "Timer started at"
    When I press "Stop Timer"
    Then I should see an entry for the new work session

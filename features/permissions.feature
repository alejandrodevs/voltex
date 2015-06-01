Feature: Default permissions

  Background:
    When I generate a new rails application
    And I configure the application to use voltex
    And I successfully run `bundle exec rails g voltex:install`
    And I successfully run `bundle exec rails g voltex:resources`
    And I successfully run `bundle exec rake db:migrate`

  Scenario: Creates default permissions
    Given I generate models named "Post Comment Product Payment"
    When I successfully run `bundle exec rake voltex`

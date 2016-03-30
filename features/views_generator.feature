Feature: Views generator
  This feature takes place when user runs 'rails g voltex:views'
  after he has included voltex in the project.

  Background:
    When I generate a new rails application
    And I successfully run `bundle exec rails g voltex:install`
    And I successfully run `bundle exec rails g voltex:resources`
    And I successfully run `bundle exec rake db:migrate`

  Scenario: Creates view to configure role permissions
    When I successfully run `bundle exec rails g voltex:views`
    Then the file "app/views/voltex/roles/edit.html.erb" should contain:
      """
      <h2>Defining Role Permissions</h2>

      <%= form_for @resource, as: Voltex.role_name, url: voltex.role_path(@resource) do |f| %>
        <% Voltex.permission_model.select(:resource).group(:resource).each do |permission| %>
          <h5><%= permission.resource.pluralize %></h5>
          <%= f.collection_check_boxes("#{Voltex.permission_name}_ids",
            Voltex.permission_model.where(resource: permission.resource), :id, :action) %>
        <% end %>

        <div class='actions'>
          <%= f.submit %>
        </div>
      <% end %>
      """

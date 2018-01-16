<% if Rails.version.to_i == 5 %>
class AddVoltexTo<%= table_name.camelize %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
<% else %>
class AddVoltexTo<%= table_name.camelize %> < ActiveRecord::Migration
<% end %>
  def change
    change_table(:<%= table_name %>) do |t|
      t.references :<%= Voltex.permission_name %>
      t.references :<%= Voltex.role_name %>
    end
  end
end

<% if Rails.version.to_i == 5 %>
class VoltexCreate<%= table_name.camelize %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
<% else %>
class VoltexCreate<%= table_name.camelize %> < ActiveRecord::Migration
<% end %>
  def change
    create_table(:<%= table_name %>) do |t|
      t.references :<%= Voltex.permission_name %>
      t.references :<%= Voltex.role_name %>
    end
  end
end

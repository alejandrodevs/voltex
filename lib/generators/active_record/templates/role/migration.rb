<% if Rails.version.to_i == 5 %>
class VoltexCreate<%= table_name.camelize %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
<% else %>
class VoltexCreate<%= table_name.camelize %> < ActiveRecord::Migration
<% end %>
  def change
    create_table(:<%= table_name %>) do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end

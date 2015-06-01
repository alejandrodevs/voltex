class VoltexCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table(:<%= table_name %>) do |t|
      t.references :<%= permission %>
      t.references :<%= role %>
    end
  end
end

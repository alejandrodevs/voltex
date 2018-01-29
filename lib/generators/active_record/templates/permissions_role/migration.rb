class VoltexCreate<%= table_name.camelize %> < <%= migration_class_name %>
  def change
    create_table(:<%= table_name %>) do |t|
      t.references :<%= Voltex.permission_name %>
      t.references :<%= Voltex.role_name %>
    end
  end
end

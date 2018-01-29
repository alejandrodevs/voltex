class VoltexCreate<%= table_name.camelize %> < <%= migration_class_name %>
  def change
    create_table(:<%= table_name %>) do |t|
      t.string :name
      t.references :<%= Voltex.role_name %>
      t.timestamps null: false
    end
  end
end

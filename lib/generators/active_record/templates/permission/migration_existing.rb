class AddVoltexTo<%= table_name.camelize %> < <%= migration_class_name %>
  def change
    change_table(:<%= table_name %>) do |t|
      t.string :resource
      t.string :action
    end
  end
end

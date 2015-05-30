class AddVoltexTo<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    change_table(:<%= table_name %>) do |t|
      t.string :resource
      t.string :action
<% attributes.each do |attribute| -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
    end
  end
end

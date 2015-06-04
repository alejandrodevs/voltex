class VoltexCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table(:<%= table_name %>) do |t|
      t.string :resource
      t.string :action
      t.timestamps null: false
    end
  end
end

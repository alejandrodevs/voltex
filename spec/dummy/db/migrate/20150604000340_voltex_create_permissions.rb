class VoltexCreatePermissions < ActiveRecord::Migration
  def change
    create_table(:permissions) do |t|
      t.string :resource
      t.string :action
      t.timestamps null: false
    end
  end
end

class VoltexCreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles) do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end

class VoltexCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name
      t.references :role
      t.timestamps null: false
    end
  end
end

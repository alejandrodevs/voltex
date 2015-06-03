class VoltexCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name
      t.integer :role_id
      t.timestamps null: false
    end

    add_index :users, :role_id
  end
end

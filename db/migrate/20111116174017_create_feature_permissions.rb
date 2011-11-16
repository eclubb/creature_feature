class CreateFeaturePermissions < ActiveRecord::Migration
  def change
    create_table :feature_permissions do |t|
      t.boolean :read_only,  :default => false

      t.integer :role_id,    :null => false
      t.integer :feature_id, :null => false
    end

    add_index :feature_permissions, [:role_id, :feature_id], :unique => true
  end
end

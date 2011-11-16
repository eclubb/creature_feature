class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, :null => false
    end

    add_index :roles, :name, :unique => true
  end
end

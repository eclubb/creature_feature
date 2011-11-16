class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name, :null => false
    end

    add_index :features, :name, :unique => true
  end
end

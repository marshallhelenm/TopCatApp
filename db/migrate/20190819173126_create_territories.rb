class CreateTerritories < ActiveRecord::Migration[5.2]
  def change
    create_table :territories do |t|
      t.integer :cat_id
      t.integer :neighborhood_id
      t.integer :cat_status
      
      t.timestamps
    end
  end
end

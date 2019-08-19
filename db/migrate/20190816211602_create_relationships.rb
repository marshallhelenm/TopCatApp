class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :cat_id
      t.integer :family_id
      t.integer :affection

      t.timestamps
    end
  end
end

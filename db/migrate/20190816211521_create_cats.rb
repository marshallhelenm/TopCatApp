class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :breed
      t.string :description
      t.integer :scraggliness
      t.integer :hunger
      t.integer :lives
      t.integer :user_id
      t.string :img_url
      t.integer :days

      t.timestamps
    end
  end
end

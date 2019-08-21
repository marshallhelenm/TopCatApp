class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.boolean :family_event
      t.integer :hazard_rating
      t.integer :neighborhood_id
      t.integer :scraggliness_score
      t.integer :hunger_score
      t.integer :lives_score

      t.timestamps
    end
  end
end

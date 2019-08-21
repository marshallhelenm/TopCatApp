class AddCredToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :cred_score, :integer
  end
end

class AddCooldownToNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    add_column :neighborhoods, :event_cooldown, :boolean
  end
end

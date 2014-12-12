class AddActiveToMissedConnections < ActiveRecord::Migration
  def change
    add_column :missed_connections, :active, :boolean, default: true
  end
end

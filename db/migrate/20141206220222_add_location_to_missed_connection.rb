class AddLocationToMissedConnection < ActiveRecord::Migration
  def change
    add_column :missed_connections, :location, :string
  end
end

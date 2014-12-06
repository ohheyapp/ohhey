class CreateMissedConnections < ActiveRecord::Migration
  def change
    create_table :missed_connections do |t|
      t.float :latitude
      t.float :longitude
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateMissedConnectionVerifications < ActiveRecord::Migration
  def change
    create_table :missed_connection_verifications do |t|
      t.integer :missed_connection_id
      t.text :text

      t.timestamps
    end
  end
end

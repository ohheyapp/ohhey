class DropMissedConnectionVerifications < ActiveRecord::Migration
  def change
    drop_table :missed_connection_verifications
  end
end

class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :sender_id
      t.integer :receiver_id
      t.datetime :read_at
      t.boolean :deleted
      t.integer :missed_connection_id

      t.timestamps
    end
  end
end

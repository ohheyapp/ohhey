class RemoveUnusedMessageAttributes < ActiveRecord::Migration
  def change
    remove_column :messages, :subject
    remove_column :messages, :read_at
    remove_column :messages, :deleted
  end
end

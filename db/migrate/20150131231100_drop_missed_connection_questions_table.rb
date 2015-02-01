class DropMissedConnectionQuestionsTable < ActiveRecord::Migration
  def change
    drop_table :missed_connection_questions
  end
end

class AddQuestionAndAnswerToMissedConnection < ActiveRecord::Migration
  def change
    add_column :missed_connections, :question, :text
    add_column :missed_connections, :answer, :text
  end
end

class DropMissedConnectionQuestionAnswers < ActiveRecord::Migration
  def change
    drop_table :missed_connection_question_answers
  end
end

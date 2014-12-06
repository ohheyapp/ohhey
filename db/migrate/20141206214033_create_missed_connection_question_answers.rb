class CreateMissedConnectionQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :missed_connection_question_answers do |t|
      t.integer :missed_connection_question_id
      t.text :text

      t.timestamps
    end
  end
end

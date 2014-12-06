class CreateMissedConnectionQuestions < ActiveRecord::Migration
  def change
    create_table :missed_connection_questions do |t|
      t.integer :missed_connection_id
      t.text :text

      t.timestamps
    end
  end
end

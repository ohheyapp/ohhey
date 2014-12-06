class MissedConnectionQuestion < ActiveRecord::Base
  belongs_to :missed_connection
  has_many :missed_connection_question_answers
end

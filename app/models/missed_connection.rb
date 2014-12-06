class MissedConnection < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :missed_connection_questions
end

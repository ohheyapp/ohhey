class MissedConnection < ActiveRecord::Base
  has_many :messages
end

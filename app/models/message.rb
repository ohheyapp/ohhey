class Message < ActiveRecord::Base
  belongs_to :sender,
    :class_name => 'User',
    :primary_key => 'user_id',
    :foreign_key => 'sender_id'

  belongs_to :receiver,
    :class_name => 'User',
    :primary_key => 'user_id',
    :foreign_key => 'receiver_id'

end

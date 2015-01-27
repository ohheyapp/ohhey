class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :received_messages,
           :class_name => 'Message',
           :foreign_key => 'receiver_id'
  has_many :sent_messages,
           :class_name => 'Message',
           :foreign_key => 'sender_id'

  def masked_email
    Digest::SHA1.hexdigest(self.email)[0,8]
  end

end

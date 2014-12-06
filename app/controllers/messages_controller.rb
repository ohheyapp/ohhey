class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
    # raise
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.receiver_id = params[]
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end

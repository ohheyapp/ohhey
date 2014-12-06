class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
    @missed_connection = MissedConnection.find(params[:mc])
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body, :receiver_id, :missed_connection_id)
  end
end

class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:mailbox] == 'sent'
      @messages = current_user.sent_messages
    elsif params[:mailbox] == 'inbox'
      @messages = current_user.received_messages
    end
  end

  def new
    #TODO verify previous page was verification
    @message = Message.new
    @missed_connection = MissedConnection.find(params[:missed_connection_id])
    @missed_connections = [@missed_connection]
  end

  def create
    @message = Message.new(message_params.merge(sender_id: current_user.id))
    @missed_connections = [@missed_connection]

    if @message.save
      redirect_to root_path, notice: 'Message Sent!'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :receiver_id, :missed_connection_id)
  end
end

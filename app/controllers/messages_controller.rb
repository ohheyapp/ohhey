class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
    @missed_connection = MissedConnection.find(params[:missed_connection_id])
    @missed_connections = [@missed_connection]
  end

  def create
    @message = Message.new(message_params.merge(sender_id: current_user.id))

    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
   @user = current_user
   if params[:mailbox] == "sent"
     @messages = @user.sent_messages
   elsif params[:mailbox] == "inbox"
     @messages = @user.received_messages
   #elsif params[:mailbox] == "archieved"
    # @messages = @user.archived_messages
   end
  end


  private

  def message_params
    params.require(:message).permit(:body, :receiver_id, :missed_connection_id)
  end
end

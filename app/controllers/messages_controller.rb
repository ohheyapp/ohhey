class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_missed_connection
  before_action :set_missed_connections

  def new
    @message = Message.new

    if params[:receiver_id].nil?
      @message.receiver_id = set_missed_connection.user_id
    else
      @message.receiver_id = params[:receiver_id]
    end

  end

  def create
    @message = Message.new(message_params.merge(message_data))

    if @message.save
      redirect_to root_path, notice: 'Message Sent!'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :receiver_id)
  end

  def set_missed_connection
    @missed_connection = MissedConnection.find(params[:missed_connection_id])
  end

  def set_missed_connections
    @missed_connections = [@missed_connection]
  end

  def message_data
    {
      sender_id: current_user.id,
      missed_connection_id: params[:missed_connection_id]
    }
  end
end

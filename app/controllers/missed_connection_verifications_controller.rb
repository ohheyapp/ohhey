class MissedConnectionVerificationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @missed_connection = MissedConnection.find(params[:missed_connection_id])
  end

  def create
    @missed_connection = MissedConnection.find(params[:missed_connection_id])

    if verification_params[:text] == @missed_connection.answer
      redirect_to new_missed_connection_message_path(@missed_connection)
    else
      render :new
    end
  end

  private

  def verification_params
    params.require(:verification).permit(:text)
  end
end

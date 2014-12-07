class MissedConnectionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
  end

  def show
    @missed_connection = MissedConnection.find(params[:id])
  end

  def new
    @missed_connection = MissedConnection.new()
  end

  def create
    @missed_connection = MissedConnection.new(missed_connection_params.merge(user_id: current_user.id))

    if @missed_connection.save
      flash[:notice] = 'Saved!'
      redirect_to root_path
    else
      flash[:notice] = 'Could not find that location. Please try again'
      render :new
    end
  end

  private

  def missed_connection_params
    params.require(:missed_connection).permit(:user_id, :title, :body, :latitude, :longitude, :location, :question, :answer)
  end
end

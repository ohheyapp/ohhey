class MissedConnectionsController < ApplicationController
  def index
    @missed_connections = MissedConnection.all
  end

before_action :authenticate_user!, :except => [:index]

  def new

    if current_user
      @missed_connection = MissedConnection.new()
    end
  end

  def create
    @missed_connection = MissedConnection.new(missed_connection_params, user: current_user)
    @missed_connection.user_id = current_user.id if current_user

    if @missed_connection.save
      flash[:notice] = 'Saved!' #TODO you shouldn't have to do this
      redirect_to root_path
    else
      flash[:notice] = 'Could not find that location; try again'
      render :new
    end

  end

  def show
    @missed_connection = MissedConnection.find(params[:id])
  end

  private

  def missed_connection_params
    params.require(:missed_connection).permit(:user_id,:title, :body, :latitude, :longitude, :location)
  end

end

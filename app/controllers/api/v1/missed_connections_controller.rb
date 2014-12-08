class Api::V1::MissedConnectionsController < ApplicationController
  def index
    @missed_connections = MissedConnection.all
    render json: @missed_connections, each_serializer: MissedConnectionsSerializer
  end

  def show
    @missed_connection = MissedConnection.find(params[:id])
    render json: @missed_connection, serializer: MissedConnectionsSerializer
  end
end

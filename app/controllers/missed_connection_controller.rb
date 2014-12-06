class MissedConnectionController < ApplicationController
  def index
    @missed_connections = MissedConnection.all
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_missed_connections

  private

  def set_missed_connections
    @missed_connections = MissedConnection.all
  end
end

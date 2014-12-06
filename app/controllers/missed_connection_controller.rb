class MissedConnectionController < ApplicationController
  def index
    @missed_connections = [
      OpenStruct.new(title: 'You had a handlebar mustache', body: 'It was great', latitude: 40.707437, longitude: -73.925189)
    ]
  end
end

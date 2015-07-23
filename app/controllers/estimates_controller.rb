class EstimatesController < ApplicationController
  def departures
    lat, long = params[:lat], params[:long]
    bikes = Bike.closest_docks lat, long
    train_station = TrainStation.closest_station lat, long
    # trains = Train.next_trains train_station.first.code

    @locations = bikes + train_station
  end

  def fares
    start_lat, start_long, end_lat, end_long = params[:lat1], params[:long1], params[:lat2], params[:long2]
    @ubers = UberAPI.fare_estimate start_lat, start_long, end_lat, end_long
  end
end
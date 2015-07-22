class EstimatesController < ApplicationController
  def departures
    lat, long = params[:lat], params[:long]
    bikes = Bike.closest_docks lat, long
    train_station = TrainStation.closest_station lat, long
    # trains = Train.next_trains train_station.first.code

    @locations = bikes + train_station
  end

  # def fares

  # end
end
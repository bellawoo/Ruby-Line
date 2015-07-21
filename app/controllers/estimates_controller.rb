class EstimatesController < ApplicationController
  def departures
    lat, long = params[:lat], params[:long]
    bikes = Bike.closest_docks lat, long
    train_stations = TrainStation.closest_station lat, long
    


    @locations = bikes + train_stations
  end

  # def fares

  # end
end
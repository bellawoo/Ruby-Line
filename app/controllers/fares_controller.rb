class FaresController < ApplicationController
  def uber
    @riders = params[:riders].to_i
    @ubers = UberAPI.fare_estimate params[:lat1], params[:long1], params[:lat2], params[:long2]
    @vehicles = UberAPI.configure_riders params[:riders]
  end

  def train
    @riders = params[:riders].to_i
    start = TrainStation.closest_station params[:lat1], params[:long1]
    start_code = start.first[:code]

    destination = TrainStation.closest_station params[:lat2], params[:long2]
    destination_code = destination.first[:code]
    @train_trip = MetroAPI.fare_estimate start_code, destination_code
  end
end
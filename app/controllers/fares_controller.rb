class FaresController < ApplicationController
  def uber
    @ubers = UberAPI.fare_estimate params[:lat1], params[:long1], params[:lat2], params[:long2]
  end

  # def trains
  #   start_code = TrainStation.closest_station.first(:code) params[:lat1], params[:long1]
  #   destination_code = TrainStation.closest_station.first(:code) params[:lat2], params[:long2]
  #   @trains = MetroAPI.fare_estimate start_code, destination_code
  # end
end
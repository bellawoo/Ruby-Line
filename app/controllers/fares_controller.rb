class FaresController < ApplicationController
  def fares
  start_lat, start_long, end_lat, end_long = params[:lat1], params[:long1], params[:lat2], params[:long2]
  @ubers = UberAPI.fare_estimate start_lat, start_long, end_lat, end_long
  # metro = MetroAPI.fare_estimate start_lat, start_long, end_lat, end_long

  # @fares = ubers + metro
end
end
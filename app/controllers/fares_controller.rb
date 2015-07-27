class FaresController < ApplicationController
  def uber
    @ubers = UberAPI.fare_estimate params[:lat1], params[:long1], params[:lat2], params[:long2]
  end

  def trains
    
  end
end
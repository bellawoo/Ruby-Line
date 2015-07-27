class EstimatesController < ApplicationController
  def bikes
    @bikes = Bike.closest_docks params[:lat], params[:long]  
  end

  def trains
    @trains = TrainStation.closest_station params[:lat], params[:long]
  end

end
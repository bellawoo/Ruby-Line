class EstimatesController < ApplicationController
  def bike
    @bikes = Bike.closest_docks params[:lat], params[:long]  
  end

  def train
    @trains = TrainStation.closest_station params[:lat], params[:long]
  end
end
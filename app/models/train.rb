class Train < ActiveRecord::Base
  belongs_to :train_stations

  attr_reader :line, :destination, :minutes
  def initialize api_data
    @line = api_data.fetch("Line"),
    @destination = api_data.fetch("DestinationName"),
    @minutes = api_data.fetch("Min")
  end
end

class Train < ActiveRecord::Base
  Token = Figaro.env.wmata_api_key

  def initialize train
    @line = train.fetch("Line")
    @destination = train.fetch("DestinationName")
    @minutes = train.fetch("Min")    
  end

  def next_trains
    code = TrainStation.closest_station.code
    predictions = HTTParty.get("https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{code}", query: {api_key: "#{Token}" })
    trains = predictions["Trains"] # Isolates the API into an array of train hashes

    trains.map { |t| self.new(t) }
  end
end

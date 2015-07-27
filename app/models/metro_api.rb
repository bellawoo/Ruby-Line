class MetroAPI

  Token = Figaro.env.wmata_api_key

  def self.next_trains code
    predictions = HTTParty.get("https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{code}", query: {api_key: "#{Token}" })
    trains = predictions["Trains"] # Isolates the API into an array of train hashes
    trains.map { |t| Train.new(t) }
  end

  # def self.fare_estimate start_station, end_station
  #   https://api.wmata.com/Rail.svc/json/jSrcStationToDstStationInfo[?FromStationCode][&ToStationCode]
   
  # end
end
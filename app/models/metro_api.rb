class MetroAPI

  Token = Figaro.env.wmata_api_key

  def self.next_trains code
    predictions = HTTParty.get("https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{code}", query: {api_key: "#{Token}" })
    trains = predictions["Trains"] # Isolates the API into an array of train hashes
    trains.map { |t| Train.new(t) }
  end

  def self.fare_estimate start_station, end_station
    station_to_station = HTTParty.get("https://api.wmata.com/Rail.svc/json/jSrcStationToDstStationInfo", 
      query: {api_key: "#{Token}",
      FromStationCode: start_station,
      ToStationCode: end_station})

    station_to_station["StationToStationInfos"]
  end
end
class Train < ActiveRecord::Base
  belongs_to :train_stations

  Token = Figaro.env.wmata_api_key

  def self.next_trains code
    predictions = HTTParty.get("https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{code}", query: {api_key: "#{Token}" })
    trains = predictions["Trains"] # Isolates the API into an array of train hashes

    trains.map { |t| self.where(
      :line => t.fetch("Line"),
      :destination => t.fetch("DestinationName"),
      :minutes => t.fetch("Min"),
      ).first_or_create! }
  end
end

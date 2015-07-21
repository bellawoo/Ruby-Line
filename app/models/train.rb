class Train < ActiveRecord::Base
  Token = Figaro.env.wmata_api_key

  def self.populate_table
    response = HTTParty.get("https://api.wmata.com/Rail.svc/json/jStations", query: {api_key: "#{Token}" })
    metro_stations = response["Stations"]

    metro_stations.each do |m|
      self.where({
        :arriving_at => m["Name"],
        :station_code => m["Code"],
        :lat => m["Lat"],
        :long => m["Lon"],
        :line_code1 => m["LineCode1"],
        :line_code2 => m["LineCode2"],
        :line_code3 => m["LineCode3"],
        :other_platform => m["StationTogether1"]
        }).first_or_create!
    end
  end

  def self.closest_station lat, long
    Train.all.each do |m|
      distance_to_here = Haversine.distance(lat.to_f, long.to_f, m.lat, m.long).to_mi
      m[:distance] = distance_to_here
      m.save!
    end
    asc_stations = Train.all.sort_by { |h| h[:distance] }
    chosen_station = asc_stations.first[:station_code]
    chosen_lat = asc_stations.first[:lat]
    chosen_long = asc_stations.first[:long]
    self.next_trains chosen_station, chosen_lat, chosen_long
  end

  def self.next_trains chosen_station, chosen_lat, chosen_long
    predictions = HTTParty.get("https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{chosen_station}", query: {api_key: "#{Token}" })
    trains = predictions["Trains"] # Isolates the API into an array of train hashes

    @trains = []
    trains.each do |d|
      info = {
        arriving_at: d["LocationName"],
        line: d["Line"],
        destination: d["DestinationName"],
        minutes: d["Min"].to_i,
        latitude: chosen_lat,
        longitude: chosen_long
      }
      @trains.push info
    end
    @trains
  end
end

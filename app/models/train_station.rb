class TrainStation < ActiveRecord::Base
  has_many :trains
  validates_presence_of :code, :name, :lat, :long
  validates_uniqueness_of :code

  Token = Figaro.env.wmata_api_key

  def self.stations
    response = HTTParty.get("https://api.wmata.com/Rail.svc/json/jStations", query: {api_key: Token })
    metro_stations = response["Stations"]

    metro_stations.each do |m|
      self.where({
        :name => m["Name"],
        :code => m["Code"],
        :lat => m["Lat"],
        :long => m["Lon"],
        :line_code1 => m["LineCode1"],
        :line_code2 => m["LineCode2"],
        :line_code3 => m["LineCode3"],
        :other_platform => m["StationTogether1"]
        }).first_or_create!
    end
  end

  def distance other_lat, other_long
    Haversine.distance(other_lat.to_f, other_long.to_f, self.lat, self.long).to_mi
  end

  def self.closest_station lat, long
    all.min_by(2) { |s| s.distance(lat, long) }
  end

  def upcoming_trains
    # code = TrainStation.closest_station.first.code
    @upcoming_trains ||= MetroAPI.next_trains code
  end
end

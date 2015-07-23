class Bike < ActiveRecord::Base
  def self.docks
    response = HTTParty.get("https://www.capitalbikeshare.com/data/stations/bikeStations.xml")
    docking_stations = response["stations"]["station"]

    docking_stations.each do |s|
      self.where({
        :name => s["name"],
        :lat => s["lat"],
        :long => s["long"],
        :bikes_avail => s["nbBikes"],
        :docks_avail => s["nbEmptyDocks"]
        }).first_or_create!
    end
  end

  def distance other_lat, other_long
    Haversine.distance(other_lat.to_f, other_long.to_f, self.lat, self.long)
  end

  def self.closest_docks lat, long
    all.min_by(5) { |s| s.distance(lat, long) }
  end
end

json.locations @locations do |location|
  json.latitude location[:lat]
  json.longitude location[:long]
  json.name location[:name]

  if location.is_a? Bike
    json.type "bikeshare"
    json.(location, :bikes_avail, :docks_avail)
  end

  if location.is_a? TrainStation
    json.type "metrorail"
    json.trains location.upcoming_trains do |trains|
      json.(trains, :line, :destination, :minutes)
    end
  end
end
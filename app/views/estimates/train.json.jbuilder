json.locations @trains do |station|
  json.latitude station[:lat]
  json.longitude station[:long]
  json.name station[:name]
  json.trains station.upcoming_trains do |trains|
    json.(trains, :line, :destination, :minutes)
  end
end
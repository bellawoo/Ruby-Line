json.locations @locations do |location|
  json.latitude location[:lat]
  json.longitude location[:long]
  json.name location[:name]

  if location.is_a? Bike
    json.type "bikeshare"
    json.(location, :bikes_avail, :docks_avail)
  end

  if location.is_a? Train
    json.type "metrorail"
    json.(location, :line, :destination, :min)
  end
end
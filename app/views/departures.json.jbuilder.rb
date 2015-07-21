json.locations @locations do |s|
  json.latitude s[:latitude]
  json.longitude s[:longitude]
  json.name s[:name]

  if location.is_a Bike?
    json.type "bikeshare"
    json.(location, :bikes_avail, :docks_avail)
  end

  if location.is_a Train?
    json.type "metrorail"
    json.(location, :line, :destination, :min)
  end
end
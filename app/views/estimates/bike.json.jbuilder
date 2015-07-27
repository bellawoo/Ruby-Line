json.locations @bikes do |dock|
  json.latitude dock[:lat]
  json.longitude dock[:long]
  json.name dock[:name]
  json.bikes_available dock[:bikes_avail]
  json.docks_available dock[:docks_avail]
end
json.fares @ubers do |uber|
  json.type uber["display_name"]
  if uber["display_name"] != "uberTAXI"
    json.low_per_person (uber["low_estimate"]/@riders).round(2)
    json.high_per_person (uber["high_estimate"]/@riders).round(2)
  end
  json.total_estimate uber["estimate"]
  json.miles uber["distance"]
  json.duration (uber["duration"] / 60)
end

json.vehicles
  json.riders @riders
  json.uberXL_or_SUV @vehicles.first
  json.uberX_or_BLACK @vehicles.last
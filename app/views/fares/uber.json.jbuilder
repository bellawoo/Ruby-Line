json.fares @ubers do |uber|
  json.type uber["display_name"]
  json.estimate uber["estimate"]
  json.miles uber["distance"]
  json.duration (uber["duration"] / 60)
end

json.vehicles
  json.riders params[:riders]
  json.uberXL_or_SUV @vehicles.first
  json.uberX_or_BLACK @vehicles.last